import 'package:flutter/material.dart';

class PaymentSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Image(image: AssetImage("assets/images/success.png")),
          SizedBox(height: 10.0),
          Text(
            'Your payment was successful!',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
