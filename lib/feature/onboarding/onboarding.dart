import 'package:exagram/feature/login/login_page.dart';
import 'package:exagram/feature/onboarding/intro_page.dart';
import 'package:flutter/material.dart';

import 'onboarding_data.dart';

class OnBoarding extends StatelessWidget {
  final List<OnBoardingData> list = [
    const OnBoardingData(
      image: Image(image: AssetImage("assets/images/onboarding1.jpg")),
      title: "MRP Capacitación tecnológica",
      desc:
          "Acreditados como centro evaluador de competencias ante la SEP-CONOCER",
    ),
    const OnBoardingData(
      image: Image(image: AssetImage("assets/images/onboarding2.jpg")),
      title: "Aprende",
      desc:
          "Utiliza técnicas de repetición espacial para convertirte en el especialista que siempre quisiste",
    ),
    const OnBoardingData(
      image: Image(image: AssetImage("assets/images/onboarding3.jpg")),
      title: "Practica",
      desc: "Practica el conocimiento adquirido en nuestros cursos",
    ),
  ];

  OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* remove the back button in the AppBar is to set automaticallyImplyLeading to false
  here we need to pass the list and the route for the next page to be opened after this. */
    return IntroPage(
      onBoardingDataList: list,
      pageRoute: MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
