import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_x/screens/PaymentScreen/components/QRScanScreen.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../main.dart';
import '../../size_config.dart';
import 'components/paymentOptions.dart';

class QRScanScreen1 extends StatefulWidget {
  const QRScanScreen1({super.key});

  @override
  State<QRScanScreen1> createState() => _QRScanScreenState1();
}

final _paymentDetailsController = TextEditingController();

class _QRScanScreenState1 extends State<QRScanScreen1> {
  // var _paymentDetails = '';
  @override
  void initState() {
    super.initState();
    final paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);
    _paymentDetailsController.text = paymentProvider.paymentDetails;
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);
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
          fontSize: getScreenWidth(21),
          fontWeight: FontWeight.bold,
          color: appPrimaryColor,
        ),
        title: const Text("Make a Payment"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: appPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: getScreenWidth(8),
                right: getScreenWidth(8),
                bottom: getScreenHeight(5),
                top: getScreenHeight(5)),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: getScreenHeight(220),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 190, 190, 190)),
                      child: SizedBox(
                        height: getScreenHeight(215),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: getScreenHeight(50)),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const QrCodeScanScreen2(),
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.photo_camera,
                                      size: getScreenWidth(65),
                                      color: appPrimaryColor,
                                    ),
                                    SizedBox(height: getScreenHeight(15)),
                                    Text(
                                      "Scan QR Code \n to capture pament details",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: getScreenWidth(14),
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 44, 43, 43)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getScreenHeight(10)),
                    Text(
                      "Payment Details Captured",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getScreenWidth(14)),
                    ),
                    SizedBox(height: getScreenHeight(10)),
                    Container(
                      height: getScreenHeight(55),
                      width: getScreenWidth(400),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 190, 190, 190),
                          borderRadius: BorderRadius.circular(15)),
                      child: FutureBuilder(
                        future: Future.delayed(Duration.zero),
                        builder: (context, snapshot) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getScreenWidth(20),
                                vertical: getScreenHeight(15)),
                            child: TextFormField(
                              initialValue:
                                  "!! Payment details not available for now !!",
                              style: TextStyle(
                                  fontSize: getScreenWidth(14),
                                  color: Colors.red),
                              enabled: true,
                            ),
                          );
                        },
                      ),

                      // TextFormField(
                      //   //TODO Fix the error initial value == null || controller ==null : is not true error. Issues to do with returning null payment details
                      //   // controller: _paymentDetailsController,
                      //   // initialValue: paymentProvider.paymentDetails,
                      //   initialValue: "Payment details not available",
                      //   enabled: false,
                      // ),
                    ),
                    SizedBox(height: getScreenHeight(20)),
                    Text(
                      "Or \nEnter Details Manually",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getScreenWidth(14.5),
                          color: appPrimaryColor),
                    ),
                    SizedBox(height: getScreenHeight(5)),
                    const CheckboxRow(),
                    // const SizedBox(height: 15),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 105),
                    //   child: Container(
                    //     height: 45,
                    //     decoration: BoxDecoration(
                    //         color: const Color.fromARGB(215, 245, 245, 245),
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: TextButton(
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         },
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: const [
                    //             Icon(
                    //               Icons.arrow_back,
                    //               size: 30,
                    //             ),
                    //             SizedBox(width: 5),
                    //             Text(
                    //               "Back Home",
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 16),
                    //             ),
                    //           ],
                    //         )),
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _paymentDetailsController.dispose();
  //   super.dispose();
  // }
}
