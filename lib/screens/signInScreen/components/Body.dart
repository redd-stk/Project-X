import 'package:flutter/material.dart';
import 'package:project_x/screens/signUpScreen/SignUpScreen.dart';

import '../../../constants.dart';
import '../../../extra components/defaultButton.dart';
import '../../../size_config.dart';
import '../../otpVerificationScreen/otpverification.dart';
import 'SignInForm.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(25)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getScreenHeight(50)),
              // SizedBox(height: SizeConfig.screenHeight! * 0.0005),
              CircleAvatar(
                // foregroundColor: Colors.grey,
                // backgroundColor: Colors.black,
                radius: getScreenWidth(45),
                child: Image.asset("assets/images/logo.jpeg"),
              ),
              SizedBox(height: getScreenHeight(10)),
              Text(
                "Welcome Back",
                style: headingStyle,
              ),
              SizedBox(height: getScreenHeight(10)),
              Text(
                "Login with your registered email and password to continue",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: getScreenWidth(14)),
              ),
              SizedBox(height: getScreenHeight(25)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(5)),
                child: const SignInForm(),
              ),
              SizedBox(height: getScreenHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    // TODO : Add a new screen for phone number sign in
                    child: Text(
                      "Login with phone number",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textButtonColor,
                          fontSize: getScreenWidth(13)),
                    ),
                  ),
                  SizedBox(height: getScreenHeight(5)),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textButtonColor,
                          fontSize: getScreenWidth(13)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getScreenHeight(25)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(90)),
                child: DefaultButton(
                    text: "Sign In",
                    pressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtpVerification()));
                    }),
              ),
              SizedBox(height: getScreenHeight(30)),
              const NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: getScreenWidth(13)),
        ),
        GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen())),
            child: Text(
              "Sign Up ",
              style: TextStyle(
                  fontSize: getScreenWidth(13),
                  color: textButtonColor,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
