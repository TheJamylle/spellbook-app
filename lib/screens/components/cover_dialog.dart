import 'package:flutter/material.dart';

showCoverDialog({
  required BuildContext context,
  required String urlImage,
  required String title,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withAlpha(200),
    builder: (context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          builder: (BuildContext context, double value, Widget? subTree) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  urlImage,
                  height: (MediaQuery.of(context).size.height * 0.6) * value,
                  fit: BoxFit.contain,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
