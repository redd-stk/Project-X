import 'package:flutter/material.dart';
import 'package:project_x/extra%20components/defaultButton.dart';

import '../../../constants.dart';
import 'otpForm.dart';

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
              const SizedBox(height: 30),
              Text(
                "Verification Code",
                style: headingStyle,
              ),
              const SizedBox(height: 10),
              const Text(
                "Enter the verification code sent to \n +2547 12 123 123",
                textAlign: TextAlign.center,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Change Phone Number",
                    style: TextStyle(
                        fontSize: 14,
                        color: appPrimaryColor,
                        fontWeight: FontWeight.bold),
                  )),
              OtpForm(),

              const SizedBox(height: 20),
              const Text("Didn't receive any code?"),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Resend code after: 1***"),
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 233, 233, 233)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                        ),
                        child: const Text(
                          "Resend Code",
                          style: TextStyle(
                              fontSize: 14,
                              color: appPrimaryColor,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: 200,
                height: 55,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 30, 117, 247)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //           const SizedBox(height: 170),
              //           Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 15),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 SizedBox(
              //                   width: 100,
              //                   height: 50,
              //                   child: TextButton(
              //                     onPressed: () {},
              //                     style: ButtonStyle(
              //                       backgroundColor: MaterialStateProperty.all<Color>(
              //                           const Color.fromARGB(255, 30, 117, 247)),
              //                       shape:
              //                           MaterialStateProperty.all<RoundedRectangleBorder>(
              //                               RoundedRectangleBorder(
              //                                   borderRadius: BorderRadius.circular(10))),
              //                     ),
              //                     child: const Text(
              //                       "Resend",
              //                       style: TextStyle(
              //                           color: Colors.white, fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 100,
              //                   height: 50,
              //                   child: TextButton(
              //                     onPressed: () {},
              //                     style: ButtonStyle(
              //                       backgroundColor: MaterialStateProperty.all<Color>(
              //                           const Color.fromARGB(255, 30, 117, 247)),
              //                       shape:
              //                           MaterialStateProperty.all<RoundedRectangleBorder>(
              //                               RoundedRectangleBorder(
              //                                   borderRadius: BorderRadius.circular(10))),
              //                     ),
              //                     child: const Text(
              //                       "Confirm",
              //                       style: TextStyle(
              //                           color: Colors.white, fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
            ],
          ),
        ),
      ),
    );
  }
}
