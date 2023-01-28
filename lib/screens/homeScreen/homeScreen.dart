import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/Body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 203, 212, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(235, 188, 197, 229),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(235, 180, 187, 212),
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          fontSize: getScreenWidth(22),
          fontWeight: FontWeight.bold,
          color: appPrimaryColor,
        ),
        title: Column(
          children: [
            Text(
              'Hello "User"',
              style: TextStyle(color: Color.fromARGB(255, 83, 82, 82)),
            ),
            SizedBox(height: getScreenWidth(7)),
            Text(
              "logged in as passenger/operator",
              style: TextStyle(
                  fontSize: getScreenWidth(12),
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 100, 99, 99)),
            )
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
    );
  }
}
