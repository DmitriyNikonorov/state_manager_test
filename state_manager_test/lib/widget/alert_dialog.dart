import 'package:flutter/cupertino.dart';

class AlertDialog extends StatelessWidget {
  final String alertText;
  final VoidCallback callBack;

  const AlertDialog({
    super.key,
    required this.alertText,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(alertText),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: callBack,
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
