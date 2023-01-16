// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_x/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    // appBarTheme: appBarTheme(),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: appTextColor),
      bodyText2: TextStyle(color: appTextColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(197, 219, 219, 219),
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: appPrimaryColor,
    ),
  );
}

InputDecoration inputDeco(labeltext) {
  return InputDecoration(
    contentPadding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
    labelText: labeltext,
    labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: appPrimaryColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: appPrimaryColor)),
  );
}
