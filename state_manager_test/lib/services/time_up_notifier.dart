import 'package:flutter/material.dart';
import 'dart:async';

class TimeUpNotifier extends ValueNotifier<String> {
  TimeUpNotifier() : super(_durationString(_initialValue));

  static const int _initialValue = 0;
  final _stream = StreamController<int>();

  late Timer _timer;
  late StreamSubscription _subscription;

  static String _durationString(int duration) {
    final hours = _toStringConversation((((duration / 60) / 60) % 60));
    final minutes = _toStringConversation(((duration / 60) % 60));
    final seconds = _toStringConversation((duration % 60));
    return '$hours:$minutes:$seconds';
  }

  static String _toStringConversation(double duration) {
    return duration.floor().toString().padLeft(2, '0');
  }

  void start() {
    var counter = 0;
    var duration = const Duration(milliseconds: 1000);

    void timerWork(Timer t) {
      counter++;
      _stream.add(counter);
    }

    _timer = Timer.periodic(duration, timerWork);
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
