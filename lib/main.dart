import 'package:flutter/material.dart';
import 'package:uasd_app/screens/landing/main_landing_screen.dart';
import 'package:uasd_app/utils/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'UASD APP',
      theme: appTheme,
      home: const MainLandingScreen()
    );
  }
}
