import 'package:flutter/material.dart';
import 'package:project_x/extra%20components/defaultButton.dart';
import 'package:project_x/screens/PaymentScreen/components/QRScanScreen.dart';

import '../../constants.dart';
import 'components/paymentOptions.dart';

class QRScanScreen1 extends StatefulWidget {
  const QRScanScreen1({super.key});

  @override
  State<QRScanScreen1> createState() => _QRScanScreenState1();
}

class _QRScanScreenState1 extends State<QRScanScreen1> {
  var _paymentDetails = '';

  final formKey2 = GlobalKey<FormState>();
  late String amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 215,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 190, 190, 190)),
                      child: SizedBox(
                        height: 215,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QrCodeScanScreen2(),
                                    ),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() {
                                        _paymentDetails = value;
                                      });
                                    }
                                  });
                                },
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.photo_camera,
                                      size: 65,
                                      color: appPrimaryColor,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Scan QR Code \n to capture pament details",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
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
                    const SizedBox(height: 10),
                    const Text(
                      "Payment Details Captured",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 55,
                      width: 400,
                      decoration: BoxDecoration(
                          color: appPrimaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(_paymentDetails),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: formKey2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 8, bottom: 8, left: 20),
                          labelText: "Enter amount to pay",
                          labelStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          prefixStyle: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: appPrimaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: appPrimaryColor)),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            amount = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Or \nEnter Details Manually",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    CheckboxRow(),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child:
                          DefaultButton(text: "Make Payment", pressed: () {}),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 105),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(215, 245, 245, 245),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Back Home",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
