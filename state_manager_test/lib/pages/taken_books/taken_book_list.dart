import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/view_model/taken_books/taken_books_vm.dart';
import 'package:state_manager_test/services/service_locator.dart';
import 'package:state_manager_test/pages/taken_books/timer_label.dart';
import 'package:flutter/material.dart';

class TakenBookList extends StatelessWidget {
  const TakenBookList({super.key});

  @override
  Widget build(BuildContext context) {
    final takenBooksVM = getIt<TakenBooksVM>();
    return ValueListenableBuilder(
      valueListenable: takenBooksVM.booksList,
      builder: (_, booksList, __) {
        return ListView.builder(
          itemCount: booksList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoListTile(
                    backgroundColor: CupertinoColors.white,
                    title: Text(booksList[index]),
                    trailing: CupertinoButton(
                      child: const Text('Вернуть'),
                      onPressed: () {
                        takenBooksVM.returnBookAt(index);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
                    child: TimerLabel(index: index),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
