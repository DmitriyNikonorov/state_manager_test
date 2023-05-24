import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/view_model/taken_books/taken_books_vm.dart';
import 'package:state_manager_test/services/service_locator.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    final takenBooksManager = getIt<TakenBooksVM>();
    return ValueListenableBuilder(
      valueListenable: takenBooksManager.booksList,
      builder: (_, booksList, __) {
        return ListView.builder(
          itemCount: booksList.length,
          itemBuilder: (BuildContext context, int index) {
            return CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: Text(booksList[index]),
              trailing: CupertinoButton(
                child: const Text('Вернуть'),
                onPressed: () {
                  takenBooksManager.returnBookAt(index);
                },
              ),
            );
          },
        );
      },
    );
  }
}
