import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

class PaymentScreen2 extends StatefulWidget {
  const PaymentScreen2({super.key});

  @override
  _PaymentScreen2State createState() => _PaymentScreen2State();
}

class _PaymentScreen2State extends State<PaymentScreen2> {
  // final _formKey = GlobalKey<FormState>();
  // late String _phoneNumber;
  // late double _amount;

  Future<dynamic> startTransaction(
      {required double amount, required String phoneNumber}) async {
    try {
      final result = await MpesaFlutterPlugin.initializeMpesaSTKPush(
        businessShortCode: '174379',
        transactionType: TransactionType
            .CustomerPayBillOnline, //or CustomerBuyGoodsOnline for till numbers
        partyA: phoneNumber,
        partyB: '174379',
        callBackURL:
            Uri(scheme: "https", host: "1234.1234.co.ke", path: "/1234.php"),
        accountReference: 'Mpesa Demo',
        phoneNumber: phoneNumber,
        baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
        transactionDesc: 'Mpesa demo',
        passKey:
            'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919',
        amount: amount,
      );

      if (result.success) {
        print('STK Push successful');
        // do something if success, like showing a success message
      } else {
        print('STK Push failed');
        // show an error message
      }
    } catch (e) {
      print('Error: $e');
      // show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Payment'),
      ),
      body: Form(
        // key: _formKey,
        child: Column(
          children: <Widget>[
            // TextFormField(
            //   decoration: const InputDecoration(labelText: 'Phone Number'),
            //   // validator: (value) {
            //   //   if (value!.isEmpty) {
            //   //     return 'Please enter a phone number';
            //   //   }
            //   //   return null;
            //   // },
            //   onSaved: (value) => _phoneNumber = value!,
            // ),
            // TextFormField(
            //   decoration: const InputDecoration(labelText: 'Amount'),
            //   // validator: (value) {
            //   //   if (value!.isEmpty) {
            //   //     return 'Please enter an amount';
            //   //   }
            //   //   return null;
            //   // },
            //   onSaved: (value) => _amount = value! as double,
            // ),
            TextButton(
              onPressed: () async {
                startTransaction(amount: 1.0, phoneNumber: '254790193402');
                // if (_formKey.currentState!.validate()) {
                //   _formKey.currentState!.save();

                // }
              },
              child: const Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
