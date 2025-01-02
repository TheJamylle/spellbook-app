import 'package:flutter/material.dart';

Future<void> showLoadingDialog(BuildContext context, Future task) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        task.then((value) {
          if (context.mounted) {
            Navigator.pop(context);
          }
        });

        return const Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
}
