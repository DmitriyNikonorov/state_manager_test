// import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:state_manager_test/pages/books_storage/books_storage_manager.dart';
import 'package:state_manager_test/pages/taken_books/taken_books_manager.dart';
import 'package:state_manager_test/services/books_provider.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<TakenBooksManager>(() => TakenBooksManager());
  getIt.registerLazySingleton<BooksStorageManager>(() => BooksStorageManager());
  getIt.registerLazySingleton<BooksProvider>(() => BooksProvider());
}
