import 'package:flutter/material.dart';
import 'package:project_x/screens/signInScreen/components/Body.dart';

import '../../constants.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/signIn";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
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
