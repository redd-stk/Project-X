import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import 'components/Body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(218, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(197, 219, 219, 219),
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: appPrimaryColor,
        ),
        // backgroundColor: Color.fromARGB(218, 255, 255, 255),
        title: const Text('Hello "User"'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
    );
  }
}
