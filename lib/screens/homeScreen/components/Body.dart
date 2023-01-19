import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:project_x/screens/AcccountDetailsScreen/accountDetails.dart';
import 'package:project_x/screens/PaymentListScreen/PaymentListScreen.dart';
import 'package:project_x/screens/PaymentScreen/paymentScreen.dart';
import '../../../constants.dart';
import '../../locationSearchScreen/locationSearchScreen.dart';
import '../../mapScreen/mapScreen.dart';
import '../../mapScreen/mapScreen2.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

List<Map<String, String>> carouselItems = [
  {'imagePath': "assets/images/transactions.png", 'text': "texts"},
  {
    'imagePath': "assets/images/flawlessPayment.png",
    'text': "Easy and fast modes of payment"
  },
  {
    'imagePath': "assets/images/transparency.png",
    'text': "Multi-factor authentication for enhanced Security"
  },
  {
    'imagePath': "assets/images/gpsDirection.jpeg",
    'text': "Live location gps tracking to your destination"
  },
  {'imagePath': "assets/images/invoice.jpg", 'text': "text"},
];

class _BodyState extends State<Body> {
  CarouselController carouselController = CarouselController();

  var currentPageValue = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: SizeConfig.screenHeight! * 0.0005),
            Container(
              height: 230,
              child: Stack(
                children: <Widget>[
                  CarouselSlider(
                    items: carouselItems.map((item) {
                      return Stack(children: [
                        Container(
                            height: 230,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(item['imagePath']!)),
                              color: const Color.fromARGB(235, 106, 110, 124),
                              borderRadius: BorderRadius.circular(20),
                            )),
                        Positioned(
                          bottom: 30,
                          left: 10,
                          child: SizedBox(
                            width: 200,
                            child: Text(item['text']!,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Color.fromARGB(199, 17, 31, 37),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900)),
                          ),
                        ),
                      ]);
                    }).toList(),
                    options: CarouselOptions(
                      initialPage: 2,
                      // autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.84,
                      aspectRatio: 2.0,
                      height: 230.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPageValue = index;
                        });
                      },
                    ),
                    carouselController: carouselController,
                  ),
                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DotsIndicator(
                          dotsCount: 5,
                          position: currentPageValue.toDouble(),
                          decorator: DotsDecorator(
                            color: Color.fromARGB(255, 117, 117, 117),
                            activeColor: appPrimaryColor,
                            size: const Size.square(9.0),
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              height: 478,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
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
                                    builder: (context) => const MapScreen2()));
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
                                    builder: (context) =>
                                        const AccountScreen()));
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentsListScreen()));
                          },
                          child: Container(
                            height: 130,
                            width: 170,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/transactions2.png")),
                              color: appPrimaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 55),
                              child: Text(
                                "View \n Payments",
                                style: TextStyle(
                                    color: Color.fromARGB(210, 20, 20, 20),
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
                                    builder: (context) =>
                                        const AccountScreen()));
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
                                "Sample Text",
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
