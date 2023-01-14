import 'package:flutter/material.dart';

import 'components/Body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(218, 255, 255, 255),
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(218, 255, 255, 255),
        title: const Text('Hello "User"'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
    );
  }
}
