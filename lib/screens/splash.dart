import 'package:flutter/material.dart';
import '../route_transitions.dart';
import '../screens/dashboard.dart';
import '../theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double imageOpacity = 0;
  int timeToAnimationInMilliseconds = 2000;

  @override
  void initState() {
    waitAndShow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.modalBackgroundGradient[2],
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Image.asset(
                'assets/images/grimorio_1152.png',
                width: 300,
              ),
            ),
            AnimatedOpacity(
              opacity: imageOpacity,
              duration: Duration(milliseconds: timeToAnimationInMilliseconds),
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  getImagePathByLanguage(),
                  width: 300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  waitAndShow() {
    Future.delayed(const Duration(milliseconds: 1250)).then((value) {
      setState(() {
        imageOpacity = 1;
      });
      waitAndNextScreen();
    });
  }

  waitAndNextScreen() async {
    int timeWaiting = timeToAnimationInMilliseconds + 300;
    await Future.delayed(Duration(milliseconds: timeWaiting));
    _nextScreen();
  }

  void _nextScreen() {
    Navigator.of(context).pushReplacement(
      sliderRouteTransition(
        const Dashboard(),
        duration: const Duration(milliseconds: 2000),
        curve: Curves.bounceOut,
        beginPosition: const Offset(1, 0),
      ),
    );
  }

  String getImagePathByLanguage() {
    String code = Localizations.localeOf(context).languageCode;

    switch (code) {
      case "pt":
        return 'assets/images/grimorio_titulo_1152.png';

      case "en":
        return 'assets/images/grimorio_titulo_1152-en.png';

      case "es":
        return 'assets/images/grimorio_titulo_1152-es.png';

      default:
        return 'assets/images/grimorio_titulo_1152-en.png';
    }
  }
}
