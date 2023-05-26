import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/services/books_provider.dart';
import 'package:state_manager_test/services/service_locator.dart';
import 'package:state_manager_test/data/routes.dart';
import 'package:state_manager_test/services/time_up_notifier.dart';

final class TakenBooksVM {
  final _booksProvider = getIt<BooksProvider>();
  final booksList = ValueNotifier<List<String>>([]);
  List<TimeUpNotifier> timeUpNotifiers = [];

  void returnBookAt(int index) {
    booksList.value = _booksProvider.returnBookAt(index);
    _updateTimersAt(index);
  }

  void _updateTimersAt(int index) {
    timeUpNotifiers[index].stop();
    timeUpNotifiers.removeAt(index);

    List<TimeUpNotifier> newTimeUpNotifiers = [];
    newTimeUpNotifiers.addAll(timeUpNotifiers);
    timeUpNotifiers = newTimeUpNotifiers;
  }

  void refreshBooksState() {
    booksList.value = [];
    booksList.value = _booksProvider.getTakenBooks;
  }

  void openBooksStorage(BuildContext context) {
    Navigator.pushNamed(context, Routes.booksStoragePage);
  }

  void createTimeUpNotifier() {
    if (booksList.value.length > timeUpNotifiers.length) {
      final timeUpNotifier = TimeUpNotifier();
      timeUpNotifier.start();
      timeUpNotifiers.add(timeUpNotifier);
    }
  }
}
