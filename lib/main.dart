import 'package:flutter/material.dart';
import 'package:project_x/screens/signInScreen/signInScreen.dart';
import 'package:project_x/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class PaymentProvider with ChangeNotifier {
  String? _paymentDetails;

  String get paymentDetails =>
      _paymentDetails ?? "Payment Details not available";

  set paymentDetails(String value) {
    _paymentDetails = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PublicTransportApp',
        theme: theme(),
        // home: SignUpScreen(),
        home: const SignInScreen(),
      ),
    );
  }
}
