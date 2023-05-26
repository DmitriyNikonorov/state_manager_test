import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/view_model/books_storage.dart/books_storage_vm.dart';
import 'package:state_manager_test/services/service_locator.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    final booksStorageVM = getIt<BooksStorageVM>();
    return ValueListenableBuilder(
      valueListenable: booksStorageVM.storageBooksList,
      builder: (_, booksList, __) {
        return ListView.builder(
          itemCount: booksList.length,
          itemBuilder: (BuildContext context, int index) {
            return CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: Text(booksList[index]),
              trailing: CupertinoButton(
                child: const Text('Взять'),
                onPressed: () {
                  booksStorageVM.takeBook(context, index);
                },
              ),
            );
          },
        );
      },
    );
  }
}
