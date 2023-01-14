import 'package:flutter/material.dart';
import 'package:project_x/screens/signInScreen/signInScreen.dart';
import 'package:project_x/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PublicTransportApp',
      theme: theme(),
      // home: SignUpScreen(),
      home: const SignInScreen(),
    );
  }
}
