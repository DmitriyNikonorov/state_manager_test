import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/services/books_provider.dart';
import 'package:state_manager_test/services/service_locator.dart';
import 'package:state_manager_test/widget/alert_dialog.dart';
import 'package:state_manager_test/view_model/taken_books/taken_books_vm.dart';

final class BooksStorageVM {
  final _booksProvider = getIt<BooksProvider>();
  final storageBooksList = ValueNotifier<List<String>>([]);

  final takenBooksVM = getIt<TakenBooksVM>();

  void takeBooksAt(int index) {
    storageBooksList.value = _booksProvider.takeBookAt(index);
  }

  void initBooksState() {
    storageBooksList.value = _booksProvider.getBooksInStorage;
  }

  void backToTakenBooks(BuildContext context) {
    Navigator.pop(context);
  }

  void takeBook(BuildContext context, int index) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alertText: 'Вы взяли ${storageBooksList.value[index]}',
          callBack: () {
            backToTakenBooks(context);
            takeBooksAt(index);
            takenBooksVM.refreshBooksState();
          },
        );
      },
    );
  }
}
