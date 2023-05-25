import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/view_model/taken_books/taken_books_vm.dart';
import 'package:state_manager_test/services/service_locator.dart';
import 'package:state_manager_test/pages/taken_books/timer_label.dart';
import 'package:flutter/material.dart';

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
            return Card(
              child: Column(
                children: [
                  CupertinoListTile(
                    backgroundColor: CupertinoColors.white,
                    title: Text(booksList[index]),
                    trailing: CupertinoButton(
                      child: const Text('Вернуть'),
                      onPressed: () {
                        takenBooksManager.returnBookAt(index);
                        takenBooksManager.updateTimersAt(index);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 18)),
                      TimerLabel(index: index),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 12)),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
