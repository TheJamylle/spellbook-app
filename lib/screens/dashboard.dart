import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/components/carousel_item.dart';
import '../screens/login.dart';
import '../screens/components/primary_button.dart';
import '../theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: AppBackgroundProperties.boxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SvgPicture.asset("assets/images/background.svg"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CarouselSlider(
                    items: [
                      CarouselItem(
                        imagePath: 'carousel-001.png',
                        text: AppLocalizations.of(context)!.dashboardTipRegister,
                      ),
                      CarouselItem(
                        imagePath: 'carousel-002.png',
                        text: AppLocalizations.of(context)!.dashboardTipTakeNotesText
                      ),
                      CarouselItem(
                        imagePath: 'carousel-003.png',
                        text: AppLocalizations.of(context)!.dashboardTipVisualizeText,
                      ),
                    ],
                    options: CarouselOptions(
                      height: 500,
                      aspectRatio: 1,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 1000,
                      ),
                      autoPlayCurve: Curves.easeInBack,
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: PrimaryButton(
                      text: AppLocalizations.of(context)!.dashboardEnterButton,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
