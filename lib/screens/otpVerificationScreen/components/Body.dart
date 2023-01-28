import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../homeScreen/homeScreen.dart';
import 'otpForm.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: SizeConfig.screenHeight! * 0.0005),
              SizedBox(height: getScreenWidth(30)),
              Text(
                "Verification Code",
                style: headingStyle,
              ),
              SizedBox(height: getScreenHeight(10)),
              const Text(
                "Enter the verification code sent to \n +2547 12 123 123",
                textAlign: TextAlign.center,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Change Phone Number",
                    style: TextStyle(
                        fontSize: getScreenWidth(14),
                        color: appPrimaryColor,
                        fontWeight: FontWeight.bold),
                  )),
              const OtpForm(),

              SizedBox(height: getScreenHeight(20)),
              const Text("Didn't receive any code?"),
              SizedBox(height: getScreenHeight(10)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Resend code after: 1***"),
                    SizedBox(height: getScreenHeight(10)),
                    TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 233, 233, 233)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                        ),
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                              fontSize: getScreenWidth(13),
                              color: appPrimaryColor,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              SizedBox(height: getScreenHeight(40)),

              SizedBox(
                width: getScreenWidth(170),
                height: getScreenHeight(50),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 30, 117, 247)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getScreenWidth(15),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
