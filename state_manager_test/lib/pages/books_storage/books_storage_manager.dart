import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/services/books_provider.dart';
import 'package:state_manager_test/services/service_locator.dart';

final class BooksStorageManager {
  final booksProvider = getIt<BooksProvider>();
  final storageBooksList = ValueNotifier<List<String>>([]);

  void takeBooksAt(int index) {
    storageBooksList.value = [];
    storageBooksList.value = booksProvider.takeBookAt(index);
  }

  void initBooksState() {
    storageBooksList.value = booksProvider.getBooksInStorage();
  }
}
