import 'package:get_it/get_it.dart';
import 'package:state_manager_test/view_model/books_storage.dart/books_storage_vm.dart';
import 'package:state_manager_test/view_model/taken_books/taken_books_vm.dart';
import 'package:state_manager_test/services/books_provider.dart';
import 'package:state_manager_test/services/time_up_notifier.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<TakenBooksVM>(() => TakenBooksVM());
  getIt.registerLazySingleton<BooksStorageVM>(() => BooksStorageVM());
  getIt.registerLazySingleton<BooksProvider>(() => BooksProvider());
  getIt.registerLazySingleton<TimeUpNotifier>(() => TimeUpNotifier());
}
