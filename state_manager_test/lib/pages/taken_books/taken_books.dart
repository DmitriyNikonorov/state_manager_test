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

  void openBooksStorage() {
    Navigator.pushNamedAndRemoveUntil(
        context, '/books_storage', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemPurple,
      navigationBar: CupertinoNavigationBar(
          middle: const Text('Список взятых книг'),
          trailing: CupertinoButton(
              onPressed: openBooksStorage,
              child: const Icon(CupertinoIcons.add))),
      child: const BookListView(),
    );
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
              });
        });
  }
}
