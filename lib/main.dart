import 'package:flutter/material.dart';

import 'home_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARfilter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeSplashScreen(),
    );
  }
}
