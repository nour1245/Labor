import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:laboar/main.dart';
import 'package:laboar/view/screens/auth_screens/login.dart';
import 'package:laboar/view/screens/home_screens/layout.dart';
import 'package:laboar/view/screens/welcome_pages/onboard.dart';
import 'package:laboar/view/styles/colors.dart';

import '../../helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget? firstpage;
  bool? onboarding;
  @override
  void initState() {
    onboarding = CacheHelper.getData(key: 'onboard');
    Firstpage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: greenColor,
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset("assets/images/logo.png"),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        defaultNextScreen: firstpage,
      ),
    );
  }

  Firstpage() {
    if (onboarding != null) {
      if (userbox!.getAt(0) != null) {
        firstpage = const LayoutScreen();
      } else {
        firstpage = LoginScreen();
      }
    } else {
      firstpage = const OnboardScreen();
    }
    return firstpage;
  }
}
