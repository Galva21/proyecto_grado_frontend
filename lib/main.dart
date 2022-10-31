import 'package:flutter/material.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'screens/voluntario/root_voluntario.dart';
import 'utils/color.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pet App',
        theme: ThemeData(
          primaryColor: primary,
        ),
        home: SplashScreen(),
      ),
    );
  }
}