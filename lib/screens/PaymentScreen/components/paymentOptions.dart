import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../extra components/defaultButton.dart';
import '../../../theme.dart';

class CheckboxRow extends StatefulWidget {
  const CheckboxRow({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Checkbox(
                  value: _sendMoney,
                  onChanged: (value) {
                    setState(() {
                      _sendMoney = value!;
                      _tillNumber = false;
                      _paybill = false;
                    });
                  },
                ),
                const Text(
                  "Send Money",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: _tillNumber,
                  onChanged: (value) {
                    setState(() {
                      _tillNumber = value!;
                      _sendMoney = false;
                      _paybill = false;
                    });
                  },
                ),
                const Text(
                  "Till number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: _paybill,
                  onChanged: (value) {
                    setState(() {
                      _paybill = value!;
                      _sendMoney = false;
                      _tillNumber = false;
                    });
                  },
                ),
                const Text(
                  "Paybill",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            _sendMoney
                ? Column(
                    children: <Widget>[
                      TextFormField(
                        // enabled: _paymentDetails == null ? true : false,
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
                      Visibility(
                        visible:
                            _phoneNumber.isEmpty || _phoneNumber.length < 10,
                        child: _phoneNumber.isEmpty
                            ? const Text("Phone Number cannot be empty",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 38, 23)))
                            : const Text("Enter a valid phone number",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 38, 23))),
                      )
                    ],
                  )
                : Container(),
            _paybill
                ? Column(
                    children: <Widget>[
                      TextFormField(
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
                      const SizedBox(height: 10),
                      TextFormField(
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
                      Visibility(
                        visible:
                            _paybillNumber.isEmpty || _accountNumber.isEmpty,
                        child: Column(
                          children: [
                            if (_paybillNumber.isEmpty)
                              const Text("Paybill Number cannot be empty",
                                  style: TextStyle(color: Colors.red)),
                            if (_accountNumber.isEmpty)
                              const Text("Account Number cannot be empty",
                                  style: TextStyle(color: Colors.red))
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
            _tillNumber
                ? Column(
                    children: [
                      TextFormField(
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
                      Visibility(
                        visible: _tillNumberInput.isEmpty,
                        child: const Text("Till Number value cannot be empty",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 38, 23))),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(height: 10),
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
              child: const Text("Amount to pay cannot be empty",
                  style: TextStyle(color: Color.fromARGB(255, 255, 38, 23))),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: DefaultButton(
                  text: "Make Payment",
                  pressed: () {
                    if (hasError = true) {
                      return;
                    } else {
                      //TODO Add navigation to payment successful
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
