import 'package:flutter/cupertino.dart';
import 'books_storage_manager.dart';
import 'package:state_manager_test/services/service_locator.dart';

class BooksStorageView extends StatefulWidget {
  const BooksStorageView({super.key});

  @override
  State<BooksStorageView> createState() => _BooksStorageView();
}

class _BooksStorageView extends State<BooksStorageView> {
  final takenBooksManager = getIt<BooksStorageManager>();

  @override
  void initState() {
    takenBooksManager.initBooksState();
    super.initState();
  }

  void backToTakenBooks() {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemPurple,
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Доступные книги'),
          leading: CupertinoButton(
            onPressed: backToTakenBooks,
            child: const Icon(CupertinoIcons.back),
          ),
        ),
        child: const BookListView());
  }
}

class BookListView extends StatelessWidget {
  const BookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booksStorageManager = getIt<BooksStorageManager>();
    return ValueListenableBuilder(
        valueListenable: booksStorageManager.storageBooksList,
        builder: (context, booksList, child) {
          return ListView.builder(
              itemCount: booksList.length,
              itemBuilder: (BuildContext context, int index) {
                return CupertinoListTile(
                  backgroundColor: CupertinoColors.white,
                  title: Text(booksList[index]),
                  trailing: CupertinoButton(
                    child: const Text('Взять'),
                    onPressed: () {
                      showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              content: Text('Вы взяли ${booksList[index]}'),
                              actions: [
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    booksStorageManager.takeBooksAt(index);
                                  },
                                  child: const Text('Ok'),
                                )
                              ],
                            );
                          });
                    },
                  ),
                );
              });
        });
  }
}
