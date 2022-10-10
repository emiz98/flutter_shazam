import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shazam/screens/home_screen.dart';
import 'package:flutter_shazam/utils/palette.dart';
import 'package:flutter_shazam/widgets/button_next.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreens extends StatelessWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
            pages: [
              PageViewModel(
                title: 'Use your travel time smart',
                body:
                    'New uber services on the road: learn more about events nearby or even plan your dinnner.',
                image: buildImage("assets/images/landing2.png"),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Use your travel time smart',
                body:
                    'New uber services on the road: learn more about events nearby or even plan your dinnner.',
                image: buildImage("assets/images/landing3.png"),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Use your travel time smart',
                body:
                    'New uber services on the road: learn more about events nearby or even plan your dinnner.',
                image: buildImage("assets/images/landing1.png"),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),
            ],
            onDone: () {
              if (kDebugMode) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
            scrollPhysics: const ClampingScrollPhysics(),
            globalBackgroundColor: dark,
            showDoneButton: true,
            showNextButton: true,
            showSkipButton: true,
            isBottomSafeArea: false,
            skip: const Text("Skip",
                style: TextStyle(fontWeight: FontWeight.w600, color: white)),
            skipStyle: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            next: ButtonNext(),
            nextStyle: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            done: ButtonNext(),
            doneStyle: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            dotsDecorator: getDotsDecorator()),
      ),
    );
  }

  //widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
      imagePath,
      height: 250,
    ));
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      titleTextStyle:
          TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(
          color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w300),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: primary,
      color: Colors.white60,
      activeSize: Size(40, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
