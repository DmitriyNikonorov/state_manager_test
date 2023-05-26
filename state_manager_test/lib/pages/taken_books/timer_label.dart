import 'package:flutter/cupertino.dart';
import 'package:state_manager_test/view_model/taken_books/taken_books_vm.dart';
import 'package:state_manager_test/services/service_locator.dart';

class TimerLabel extends StatelessWidget {
  final int index;
  const TimerLabel({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final takenBooksVM = getIt<TakenBooksVM>();
    takenBooksVM.createTimeUpNotifier();
    return ValueListenableBuilder(
      valueListenable: takenBooksVM.timeUpNotifiers[index],
      builder: (_, timeUp, __) {
        return Text('книга у вас: $timeUp');
      },
    );
  }
}
