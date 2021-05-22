import 'package:arfilters_app/camera_with_mask_filters_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class HomeSplashScreen extends StatefulWidget {
  @override
  _HomeSplashScreenState createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: CameraWithMaskFiltersScreen(),
      title: Text(
        "AR • Filter",
        style: TextStyle(
          fontSize: 55,
          color: Colors.deepPurpleAccent,
          fontFamily: "Signatra",
        ),
      ),
      image: Image.asset("images/icon.png"),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.orange,
      loadingText: Text(
        "activating filters...",
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: "Brand Bold",
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}
