import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/Body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signUp";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(197, 219, 219, 219),
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          fontSize: getScreenWidth(22),
          fontWeight: FontWeight.bold,
          color: appPrimaryColor,
        ),
        title: const Text("Sign Up"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: appPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Body(),
    );
  }
}
