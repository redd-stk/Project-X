import 'package:flutter/material.dart';
import 'package:project_x/screens/AcccountDetailsScreen/accountDetails.dart';
import 'package:project_x/screens/PaymentScreen/paymentScreen.dart';
import '../../../constants.dart';
import '../../locationSearchScreen/locationSearchScreen.dart';
import '../../mapScreen/mapScreen.dart';
import '../../paymentSuccessfulScreen/paymentSuccessful.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Map> myGrid =
      List.generate(4, (index) => {"id": index, "name": "Grid $index"})
          .toList();

  PageController pageController = PageController(viewportFraction: 0.88);

  var currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: SizeConfig.screenHeight! * 0.0005),
            Container(
              decoration: const BoxDecoration(color: Colors.red),
              height: 220,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, position) {
                    return homeCarousel();
                  }),
            ),

            SizedBox(
              height: 325,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchLocationScreen()));
                          },
                          child: Container(
                            height: 130,
                            width: 170,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  opacity: 0.76,
                                  image:
                                      AssetImage("assets/images/busMap.jpg")),
                              color: appPrimaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 60, top: 20),
                              child: Text(
                                "New Trip",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const QRScanScreen1()));
                          },
                          child: Container(
                            height: 130,
                            width: 170,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  opacity: 0.7,
                                  image:
                                      AssetImage("assets/images/payment.jpg")),
                              color: appPrimaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(left: 40, top: 15, right: 10),
                              child: Text(
                                "Make A Payment",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 224, 34, 91),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MapScreen()));
                          },
                          child: Container(
                            height: 130,
                            width: 170,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/newGoogleMap.jpg")),
                              color: appPrimaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "View \n Map",
                                style: TextStyle(
                                    color: Color.fromARGB(213, 238, 8, 8),
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountScreen()));
                          },
                          child: Container(
                            height: 130,
                            width: 170,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  opacity: 0.8,
                                  image: AssetImage("assets/images/12.png")),
                              color: appPrimaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10, top: 95),
                              child: Text(
                                "My Account",
                                style: TextStyle(
                                    color: Color.fromARGB(214, 20, 20, 20),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget homeCarousel() {
  return Stack(
    children: [
      Container(
        height: 220,
        margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ],
  );
}
