import 'package:flutter/material.dart';

import '../../../constants.dart';

class CheckboxRow extends StatefulWidget {
  @override
  _CheckboxRowState createState() => _CheckboxRowState();
}

class _CheckboxRowState extends State<CheckboxRow> {
  bool _sendMoney = true;
  bool _tillNumber = false;
  bool _paybill = false;

  final formKey3 = GlobalKey<FormState>();
  late String _phoneNumber;
  late String _paybillNumber;
  late String _accountNumber;
  late String _tillNumberInput;

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
                ? TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 8, bottom: 8, left: 20),
                      labelText: "Enter Phone Number",
                      prefixText: "+254 7",
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      prefixStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: appPrimaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: appPrimaryColor)),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    onChanged: (value) {
                      setState(() {
                        _phoneNumber = value;
                      });
                    },
                  )
                : Container(),
            _paybill
                ? Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 8, bottom: 8, left: 20),
                          labelText: "Enter Paybill Number",
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
                        onChanged: (value) {
                          setState(() {
                            _paybillNumber = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 8, bottom: 8, left: 20),
                          labelText: "Enter Account Number",
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
                        onChanged: (value) {
                          setState(() {
                            _accountNumber = value;
                          });
                        },
                      ),
                    ],
                  )
                : Container(),
            _tillNumber
                ? TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 8, bottom: 8, left: 20),
                      labelText: "Enter Till Number",
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      prefixStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: appPrimaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: appPrimaryColor)),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _tillNumberInput = value;
                      });
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
