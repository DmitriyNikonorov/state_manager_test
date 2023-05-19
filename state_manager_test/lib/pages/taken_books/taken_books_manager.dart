// import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/services/books_provider.dart';
import 'package:state_manager_test/services/service_locator.dart';

final class TakenBooksManager {
  final booksProvider = getIt<BooksProvider>();
  final booksList = ValueNotifier<List<Book>>([]);

  void removeAt(int index) {
    booksProvider.removeBookFromTaken(index);
    booksList.value = booksProvider.getNewTakenBooks();
  }

  void initBooksState() {
    booksList.value.addAll(booksProvider.getTakenBooks());
  }
}
