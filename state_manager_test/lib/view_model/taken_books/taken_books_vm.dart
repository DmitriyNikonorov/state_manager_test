import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/services/books_provider.dart';
import 'package:state_manager_test/services/service_locator.dart';
import 'package:state_manager_test/data/routes.dart';

final class TakenBooksVM {
  final _booksProvider = getIt<BooksProvider>();
  final booksList = ValueNotifier<List<String>>([]);

  void returnBookAt(int index) {
    booksList.value = [];
    booksList.value = _booksProvider.returnBookAt(index);
  }

  void initBooksState() {
    booksList.value = _booksProvider.getTakenBooks;
  }

  void openBooksStorage(BuildContext context) {
    Navigator.pushNamed(context, Routes.booksStoragePage);
  }
}
