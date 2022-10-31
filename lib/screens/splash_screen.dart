import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pet_app/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Container(
          child: Center(
            child: Image.asset('assets/images/logo_albergue.jpg'),
          ),
        ),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: Duration(seconds: 2),
        backgroundColor: Colors.black,
        splashIconSize: 300,
      ),
    );
  }
}
