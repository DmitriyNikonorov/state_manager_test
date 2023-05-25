import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/view_model/taken_books/taken_books_vm.dart';
import 'package:state_manager_test/services/service_locator.dart';
import 'taken_book_list.dart';

class TakenBooksPage extends StatefulWidget {
  const TakenBooksPage({super.key});

  @override
  State<TakenBooksPage> createState() => _TakenBooksState();
}

class _TakenBooksState extends State<TakenBooksPage> {
  final _takenBooksManager = getIt<TakenBooksVM>();

  @override
  void initState() {
    _takenBooksManager.refreshBooksState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemPurple,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Список взятых книг'),
        trailing: CupertinoButton(
          onPressed: () {
            _takenBooksManager.openBooksStorage(context);
          },
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child: const BookList(),
    );
  }
}
