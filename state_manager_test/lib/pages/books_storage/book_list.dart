import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/view_model/books_storage.dart/books_storage_vm.dart';
import 'package:state_manager_test/services/service_locator.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    final booksStorageManager = getIt<BooksStorageVM>();
    return ValueListenableBuilder(
      valueListenable: booksStorageManager.storageBooksList,
      builder: (_, booksList, __) {
        return ListView.builder(
          itemCount: booksList.length,
          itemBuilder: (BuildContext context, int index) {
            return CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: Text(booksList[index]),
              trailing: CupertinoButton(
                child: const Text('Взять'),
                onPressed: () {
                  booksStorageManager.showAlertDialog(context, index);
                },
              ),
            );
          },
        );
      },
    );
  }
}

// class AlertDialog extends StatelessWidget {
//   final String alertText;
//   final void Function() callBack;

//   const AlertDialog({
//     // super.key, 
//     required this.alertText, 
//     required this.callBack
//   });
//   // const AlertDialog({super.key});

//   @override
//   Widget build(Object context) {
//     return CupertinoAlertDialog(
//       // content: Text('Вы взяли ${storageBooksList.value[index]}'),
//       content: Text(alertText),
//       actions: [
//         CupertinoDialogAction(
//           isDefaultAction: true,
//           onPressed: callBack,
//           child: const Text('Ok'),
//         ),
//       ],
//     );
//   }
// }
