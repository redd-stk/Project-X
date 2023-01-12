import 'package:flutter/material.dart';
import 'package:project_x/screens/signUpScreen/components/SignUpForm.dart';

import '../../../constants.dart';
import '../../../extra components/defaultButton.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: SizeConfig.screenHeight! * 0.0005),
              const SizedBox(height: 20),
              Text(
                "Create Your Account",
                style: headingStyle,
              ),
              const Text(
                "Fill in your details below to continue",
                textAlign: TextAlign.center,
              ),
              SignUpForm(),
              
            ],
          ),
        ),
      ),
    );
  }
}
