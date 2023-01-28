import 'package:flutter/material.dart';
import 'package:project_x/screens/paymentSuccessfulScreen/paymentSuccessful.dart';
import 'package:project_x/size_config.dart';

import '../../../extra components/defaultButton.dart';
import '../../../theme.dart';

class CheckboxRow extends StatefulWidget {
  final bool pDetails;
  const CheckboxRow({Key? key, required this.pDetails}) : super(key: key);

  @override
  _CheckboxRowState createState() => _CheckboxRowState();
}

class _CheckboxRowState extends State<CheckboxRow> {
  bool _sendMoney = true;
  bool _tillNumber = false;
  bool _paybill = false;
  bool hasError = false;

  final _paybillTextController = TextEditingController();
  final _accountNumberTextController = TextEditingController();
  final _phoneNumberTextController = TextEditingController();
  final _tillNumberTextController = TextEditingController();

  final formKey3 = GlobalKey<FormState>();
  String _phoneNumber = '';
  String _paybillNumber = '';
  String _accountNumber = '';
  String _tillNumberInput = '';
  String amount = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey3,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: _sendMoney,
                  onChanged: !widget.pDetails
                      ? null
                      : (value) {
                          setState(() {
                            _sendMoney = value!;
                            _tillNumber = false;
                            _paybill = false;
                          });
                        },
                ),
                Text(
                  "Send Money",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getScreenWidth(14)),
                ),
                Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: _tillNumber,
                  onChanged: !widget.pDetails
                      ? null
                      : (value) {
                          setState(() {
                            _tillNumber = value!;
                            _sendMoney = false;
                            _paybill = false;
                          });
                        },
                ),
                Text(
                  "Till number",
                  style: TextStyle(
                      fontSize: getScreenWidth(14),
                      fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: _paybill,
                  onChanged: !widget.pDetails
                      ? null
                      : (value) {
                          setState(() {
                            _sendMoney = false;
                            _tillNumber = false;
                            _paybill = value!;
                          });
                        },
                ),
                Text(
                  "Paybill",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getScreenWidth(14)),
                ),
              ],
            ),
            _sendMoney
                ? Column(
                    children: <Widget>[
                      TextFormField(
                        // enabled: _paymentDetails == null ? true : false,
                        enabled: !widget.pDetails == false ? true : false,
                        controller: _phoneNumberTextController,
                        decoration: inputDeco("Enter Phone Number"),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        onChanged: (value) {
                          setState(() {
                            _phoneNumber = value;
                            if (_phoneNumber.isEmpty ||
                                _phoneNumber.length < 10) {
                              hasError = true;
                            } else {
                              hasError = false;
                            }
                          });
                        },
                      ),
                      Offstage(
                        offstage: !widget.pDetails,
                        child: Visibility(
                          visible:
                              _phoneNumber.isEmpty || _phoneNumber.length < 10,
                          child: _phoneNumber.isEmpty
                              ? Text("Phone Number cannot be empty",
                                  style: TextStyle(
                                      fontSize: getScreenWidth(13.5),
                                      color: Color.fromARGB(255, 255, 38, 23)))
                              : const Text("Enter a valid phone number",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 38, 23))),
                        ),
                      )
                    ],
                  )
                : Container(),
            _paybill
                ? Column(
                    children: <Widget>[
                      TextFormField(
                        enabled: !widget.pDetails == false ? true : false,
                        keyboardType: TextInputType.number,
                        decoration: inputDeco("Enter Paybill Number"),
                        onChanged: (value) {
                          setState(() {
                            _paybillNumber = value;
                            if (_paybillNumber.isEmpty ||
                                _accountNumber.isEmpty) {
                              hasError = true;
                            } else {
                              hasError = false;
                            }
                          });
                        },
                      ),
                      SizedBox(height: getScreenHeight(10)),
                      TextFormField(
                        enabled: !widget.pDetails == false ? true : false,
                        decoration: inputDeco("Enter Account Number"),
                        onChanged: (value) {
                          setState(() {
                            _accountNumber = value;
                            if (_paybillNumber.isEmpty ||
                                _accountNumber.isEmpty) {
                              hasError = true;
                            } else {
                              hasError = false;
                            }
                          });
                        },
                      ),
                      Offstage(
                        offstage: !widget.pDetails,
                        child: Visibility(
                          visible:
                              _paybillNumber.isEmpty || _accountNumber.isEmpty,
                          child: Column(
                            children: [
                              if (_paybillNumber.isEmpty)
                                Text("Paybill Number cannot be empty",
                                    style: TextStyle(
                                        fontSize: getScreenWidth(13.5),
                                        color: Colors.red)),
                              if (_accountNumber.isEmpty)
                                Text("Account Number cannot be empty",
                                    style: TextStyle(
                                        fontSize: getScreenWidth(13.5),
                                        color: Colors.red))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            _tillNumber
                ? Column(
                    children: [
                      TextFormField(
                        enabled: !widget.pDetails == false ? true : false,
                        decoration: inputDeco("Enter Till Number"),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _tillNumberInput = value;
                            if (_tillNumberInput.isEmpty) {
                              hasError = true;
                            } else {
                              hasError = false;
                            }
                          });
                        },
                      ),
                      Offstage(
                        offstage: !widget.pDetails,
                        child: Visibility(
                          visible: _tillNumberInput.isEmpty,
                          child: Text("Till Number value cannot be empty",
                              style: TextStyle(
                                  fontSize: getScreenWidth(13.5),
                                  color: Color.fromARGB(255, 255, 38, 23))),
                        ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: getScreenHeight(10)),
            TextFormField(
              decoration: inputDeco("Enter amount to pay"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amount = value;
                });
              },
            ),
            Visibility(
              visible: amount.isEmpty,
              child: Text("Amount to pay cannot be empty",
                  style: TextStyle(
                      fontSize: getScreenWidth(13.5),
                      color: Color.fromARGB(255, 255, 38, 23))),
            ),
            SizedBox(height: getScreenHeight(15)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(90)),
              child: DefaultButton(
                  text: "Make Payment",
                  pressed: () {
                    // if (hasError = true) {
                    //   return;
                    // } else {
                    //   //TODO Add navigation to payment successful
                    // }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentSuccessful()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
