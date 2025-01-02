import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final String text;
  const CarouselItem({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/carousel/$imagePath"),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w500,
            fontFamily: "Bigelow Rules",
          ),
        ),
      ],
    );
  }
}
