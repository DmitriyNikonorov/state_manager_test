import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/pages/books_storage/books_storage.dart';
import 'services/service_locator.dart';
import 'pages/taken_books/taken_books.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const TakenBooksView(),
        '/books_storage': (context) => const BooksStorageView()
      },
    );
  }
}
