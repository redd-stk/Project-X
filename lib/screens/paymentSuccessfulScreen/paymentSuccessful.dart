import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_x/extra%20components/defaultButton.dart';
import 'package:project_x/screens/homeScreen/homeScreen.dart';

class PaymentSuccessful extends StatelessWidget {
  final String destination = "Kabu Main Gate";
  final amount = " 100";

  PaymentSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 65, right: 65, top: 200),
      child: Column(
        children: <Widget>[
          const SizedBox(
              height: 120,
              width: 240,
              child: Image(image: AssetImage("assets/images/success.png"))),
          const SizedBox(height: 20.0),
          const Text(
            "Your payment was successful!",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 53, 53, 53)),
          ),
          const SizedBox(height: 20.0),
          Text(
            "Date: ${DateTime.now().toString().substring(0, 16)} ${DateFormat.jm().format(DateTime.now())}",
            style: const TextStyle(
                fontSize: 14.0, color: Color.fromARGB(255, 52, 52, 54)),
          ),
          const SizedBox(height: 10.0),
          Text(
            "Destination: $destination",
            style: const TextStyle(
                fontSize: 14.0, color: Color.fromARGB(255, 52, 52, 54)),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Amount paid: ",
                style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 52, 52, 54)),
              ),
              Text(
                "Kshs. $amount",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 206, 38, 38)),
              ),
            ],
          ),
          const SizedBox(height: 250),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 81, 81, 82)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Text("Home",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
