import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    orientation = _mediaQueryData!.orientation;
  }
}

// getting proportinate height as per screen size
double getScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight!;
  return (inputHeight / 812.0) * screenHeight;
}

// getting the proportinate screenWidth as per screen size
double getScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth!;
  return (inputWidth / 375.0) * screenWidth;
}
