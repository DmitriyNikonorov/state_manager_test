import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'taken_books_manager.dart';
import 'package:state_manager_test/services/service_locator.dart';

class TakenBooksView extends StatefulWidget {
  const TakenBooksView({super.key});

  @override
  State<TakenBooksView> createState() => _TakenBooksState();
}

class _TakenBooksState extends State<TakenBooksView> {
  final takenBooksManager = getIt<TakenBooksManager>();

  @override
  void initState() {
    takenBooksManager.initBooksState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemPurple,
        navigationBar: CupertinoNavigationBar(middle: Text('Книги')),
        child: BookListView());
  }
}

class BookListView extends StatelessWidget {
  const BookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final takenBooksManager = getIt<TakenBooksManager>();
    return ValueListenableBuilder(
        valueListenable: takenBooksManager.booksList,
        builder: (context, booksList, child) {
          return ListView.builder(
              itemCount: takenBooksManager.booksList.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(booksList[index].name),
                    trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          takenBooksManager.removeAt(index);
                        }),
                  ),
                );
              });
        });
  }
}
