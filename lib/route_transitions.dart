import 'package:flutter/material.dart';

Route sliderRouteTransition(
  Widget nextScreen, {
  Duration duration = const Duration(milliseconds: 1000),
  Curve curve = Curves.ease,
  Offset beginPosition = const Offset(-1, 1),
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Animatable<Offset> tween =
          Tween(begin: beginPosition, end: Offset.zero).chain(
        CurveTween(curve: curve),
      );
      return SlideTransition(
        position: animation.drive(tween),
        child: nextScreen,
      );
    },
  );
}
