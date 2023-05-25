import 'package:flutter/material.dart';
import 'dart:async';

class TimeUpNotifier extends ValueNotifier<String> {
  TimeUpNotifier() : super(_durationString(_initialValue));

  static const int _initialValue = 0;
  final _stream = StreamController<int>();

  late Timer _timer;
  late StreamSubscription _subscription;

  static String _durationString(int duration) {
    final hours =
        (((duration / 60) / 60) % 60).floor().toString().padLeft(2, '0');
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration % 60).floor().toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  void start() {
    var counter = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (Timer t) {
      counter++;
      _stream.add(counter);
    });

    _subscription = _stream.stream.listen((item) => _updateTimeLeft(item));
  }

  void _updateTimeLeft(int seconds) {
    value = _durationString(seconds);
  }

  void stop() {
    _timer.cancel();
    _subscription.cancel();
  }
}
