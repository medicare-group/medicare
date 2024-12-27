import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicare/screen/login/select_city_screen.dart';

import '../../commom/color_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    load();
  }

  void load() async {
    await Future.delayed(const Duration(seconds: 3));
    loadNextScreen();
  }

  void loadNextScreen() {
    // OnBoardingScreen
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SelectCityScreen()),
        (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('assets/imgs/splash_logo.png',
            width: context.width * 0.35, fit: BoxFit.contain),
      ),
    );
  }
}
