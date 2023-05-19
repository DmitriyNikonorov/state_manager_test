import 'package:flutter/cupertino.dart';
import 'services/service_locator.dart';
import 'pages/taken_books/taken_books.dart';

void main() {
  setupGetIt();
  runApp(const CupertinoApp(
    home: TakenBooksView(),
  ));
}
