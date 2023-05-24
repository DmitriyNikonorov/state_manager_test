import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/view_model/books_storage.dart/books_storage_vm.dart';
import 'package:state_manager_test/services/service_locator.dart';
import 'books_storage_list.dart';

class BooksStoragePage extends StatefulWidget {
  const BooksStoragePage({super.key});

  @override
  State<BooksStoragePage> createState() => _BooksStoragePageState();
}

class _BooksStoragePageState extends State<BooksStoragePage> {
  final takenBooksManager = getIt<BooksStorageVM>();

  @override
  void initState() {
    takenBooksManager.initBooksState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemPurple,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Доступные книги'),
        leading: CupertinoButton(
          onPressed: () {
            takenBooksManager.backToTakenBooks(context);
          },
          child: const Icon(CupertinoIcons.back),
        ),
      ),
      child: const BookList(),
    );
  }
}
