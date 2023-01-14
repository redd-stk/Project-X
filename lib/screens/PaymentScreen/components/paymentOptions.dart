import 'package:flutter/material.dart';

class CheckboxRow extends StatefulWidget {
  @override
  _CheckboxRowState createState() => _CheckboxRowState();
}

class _CheckboxRowState extends State<CheckboxRow> {
  bool _sendMoney = false;
  bool _tillNumber = false;
  bool _paybill = false;
  late String _phoneNumber;
  late String _paybillNumber;
  late String _accountNumber;
  late String _tillNumberInput;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              Text("Send Money"),
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
              Text("Till number"),
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
              Text("Paybill"),
            ],
          ),
          _sendMoney
              ? TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Phone Number",
                    prefixText: "+254 7",
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
                      decoration: InputDecoration(
                        labelText: "Enter Paybill Number",
                      ),
                      onChanged: (value) {
                        setState(() {
                          _paybillNumber = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Account Number",
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
                    labelText: "Enter Till Number",
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
    );
  }
}
