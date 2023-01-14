import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'paymentOptions.dart';

class Payment2 extends StatelessWidget {
  const Payment2({
    Key? key,
    required String paymentDetails,
  })  : _paymentDetails = paymentDetails,
        super(key: key);

  final String _paymentDetails;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 250,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    "Payment Details Captured",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 45,
                    width: 400,
                    decoration: const BoxDecoration(color: appPrimaryColor),
                    child: Text(_paymentDetails),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Or \nEnter Details Manually",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  CheckboxRow(),
                ],
              ),
            ),
          ),
        ));
  }
}
