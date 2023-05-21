// import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/services/books_provider.dart';
import 'package:state_manager_test/services/service_locator.dart';

final class TakenBooksManager {
  final booksProvider = getIt<BooksProvider>();
  final booksList = ValueNotifier<List<String>>([]);

  void returnBookAt(int index) {
    booksList.value = [];
    booksList.value = booksProvider.returnBookAt(index);
  }

  void initBooksState() {
    booksList.value = booksProvider.getTakenBooks();
  }
}
