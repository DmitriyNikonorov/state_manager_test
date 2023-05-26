import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/pages/books_storage/books_storage_page.dart';
import 'services/service_locator.dart';
import 'pages/taken_books/taken_books_page.dart';
import 'data/routes.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: Routes.takenBooksPage,
      routes: {
        Routes.takenBooksPage: (context) => const TakenBooksPage(),
        Routes.booksStoragePage: (context) => const BooksStoragePage()
      },
    );
  }
}
