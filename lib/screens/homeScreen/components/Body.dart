import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:project_x/screens/AcccountDetailsScreen/accountDetails.dart';
import 'package:project_x/screens/PaymentListScreen/PaymentListScreen.dart';
import 'package:project_x/screens/PaymentScreen/paymentScreen.dart';
import 'package:project_x/screens/mapScreen/mapScreen3.dart';
import 'package:project_x/size_config.dart';

import '../../../MPESA/mpesaDemo.dart';
import '../../../constants.dart';
import '../../locationSearchScreen/locationSearchScreen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

List<Map<String, String>> carouselItems = [
  {
    'imagePath': "assets/images/transparency.png",
    'text': "Multi-factor authentication for enhanced Security"
  },
  {
    'imagePath': "assets/images/flawlessPayment.png",
    'text': "Easy and fast modes of payment"
  },
  {
    'imagePath': "assets/images/gpsDirection.jpeg",
    'text': "Live location gps tracking to your destination"
  },
  {'imagePath': "assets/images/transactions.png", 'text': "Sample texts"},
  {'imagePath': "assets/images/invoice.jpg", 'text': "Sample text"},
];

class _BodyState extends State<Body> {
  CarouselController carouselController = CarouselController();

  var currentPageValue = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: SizeConfig.screenHeight! * 0.0005),
            SizedBox(
              height: getScreenHeight(270),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    items: carouselItems.map((item) {
                      return Stack(children: [
                        Container(
                            height: getScreenHeight(230),
                            margin: EdgeInsets.only(
                                top: getScreenHeight(10),
                                bottom: getScreenHeight(10)),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(item['imagePath']!)),
                              color: const Color.fromARGB(235, 106, 110, 124),
                              borderRadius: BorderRadius.circular(20),
                            )),
                        Positioned(
                          bottom: getScreenHeight(30),
                          left: getScreenWidth(10),
                          child: SizedBox(
                            width: getScreenWidth(200),
                            child: Text(item['text']!,
                                softWrap: true,
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(199, 17, 31, 37),
                                    fontSize: getScreenWidth(23),
                                    fontWeight: FontWeight.w900)),
                          ),
                        ),
                      ]);
                    }).toList(),
                    options: CarouselOptions(
                      initialPage: 0,
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
                      height: getScreenHeight(240),
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPageValue = index;
                        });
                      },
                    ),
                    carouselController: carouselController,
                  ),
                  // Positioned(
                  //   bottom: 5,
                  //   left: 0,
                  //   right: 0,
                  //   child:
                  DotsIndicator(
                    dotsCount: 5,
                    position: currentPageValue.toDouble(),
                    decorator: DotsDecorator(
                      // color: const Color.fromARGB(255, 117, 117, 117),
                      color: const Color.fromARGB(255, 107, 107, 107),
                      activeColor: appPrimaryColor,
                      size: Size.square(getScreenHeight(9.0)),
                      activeSize:
                          Size(getScreenWidth(18.0), getScreenHeight(9.0)),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  // ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: getScreenHeight(590),
              child: Padding(
                padding: EdgeInsets.only(
                    left: getScreenWidth(5),
                    right: getScreenWidth(5),
                    bottom: getScreenHeight(5)),
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
                          child: Column(
                            children: [
                              Container(
                                height: getScreenHeight(130),
                                width: getScreenWidth(165),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      opacity: 0.8,
                                      image: AssetImage(
                                          "assets/images/busMap.jpg")),
                                  color: appPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: Color.fromARGB(255, 101, 170, 235)),
                                height: getScreenHeight(40),
                                width: getScreenWidth(165),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text("New trip",
                                          style: TextStyle(
                                              fontSize: getScreenWidth(21),
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromARGB(
                                                  200, 49, 49, 49))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: getScreenWidth(5)),
                                      child: Icon(
                                        color: Color.fromARGB(200, 49, 49, 49),
                                        Icons.arrow_forward,
                                        size: getScreenWidth(30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                          child: Column(
                            children: [
                              Container(
                                height: getScreenHeight(130),
                                width: getScreenWidth(165),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      opacity: 0.8,
                                      image: AssetImage(
                                          "assets/images/payment.jpg")),
                                  color: appPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: Color.fromARGB(255, 101, 170, 235)),
                                height: getScreenHeight(40),
                                width: getScreenWidth(165),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: getScreenWidth(20)),
                                      child: Text("Payment",
                                          style: TextStyle(
                                              fontSize: getScreenWidth(21),
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromARGB(
                                                  200, 49, 49, 49))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: getScreenWidth(5)),
                                      child: Icon(
                                        color: Color.fromARGB(200, 49, 49, 49),
                                        Icons.arrow_forward,
                                        size: getScreenWidth(30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                                    builder: (context) => const MapScreen3()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: getScreenHeight(130),
                                width: getScreenWidth(165),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      opacity: 1.0,
                                      image: AssetImage(
                                          "assets/images/newGoogleMap.jpg")),
                                  color: appPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: Color.fromARGB(255, 101, 170, 235)),
                                height: getScreenHeight(40),
                                width: getScreenWidth(165),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text("View Map",
                                          style: TextStyle(
                                              fontSize: getScreenWidth(21),
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromARGB(
                                                  200, 49, 49, 49))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: getScreenWidth(5)),
                                      child: Icon(
                                        color: Color.fromARGB(200, 49, 49, 49),
                                        Icons.arrow_forward,
                                        size: getScreenWidth(30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                          child: Column(
                            children: [
                              Container(
                                height: getScreenHeight(130),
                                width: getScreenWidth(165),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      opacity: 1.0,
                                      image:
                                          AssetImage("assets/images/12.png")),
                                  color: appPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: Color.fromARGB(255, 101, 170, 235)),
                                height: getScreenHeight(40),
                                width: getScreenWidth(165),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: getScreenWidth(5)),
                                      child: Text("My Account",
                                          style: TextStyle(
                                              fontSize: getScreenWidth(21),
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromARGB(
                                                  200, 49, 49, 49))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: getScreenWidth(2)),
                                      child: Icon(
                                        color: Color.fromARGB(200, 49, 49, 49),
                                        Icons.arrow_forward,
                                        size: getScreenWidth(30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                          child: Column(
                            children: [
                              Container(
                                height: getScreenHeight(130),
                                width: getScreenWidth(165),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      opacity: 1.0,
                                      image: AssetImage(
                                          "assets/images/transactions2.png")),
                                  color: appPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: Color.fromARGB(255, 101, 170, 235)),
                                height: getScreenHeight(62),
                                width: getScreenWidth(165),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: getScreenWidth(5)),
                                      child: Text("View \n Payments",
                                          style: TextStyle(
                                              fontSize: getScreenWidth(21),
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromARGB(
                                                  221, 49, 49, 49))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: getScreenWidth(2)),
                                      child: Icon(
                                        color: Color.fromARGB(200, 49, 49, 49),
                                        Icons.arrow_forward,
                                        size: getScreenWidth(30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentScreen2()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: getScreenHeight(130),
                                width: getScreenWidth(165),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      opacity: 1.0,
                                      image:
                                          AssetImage("assets/images/12.png")),
                                  color: appPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: Color.fromARGB(255, 101, 170, 235)),
                                height: getScreenHeight(40),
                                width: getScreenWidth(165),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: getScreenWidth(5)),
                                      child: Text("My Account",
                                          style: TextStyle(
                                              fontSize: getScreenWidth(21),
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromARGB(
                                                  200, 49, 49, 49))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: getScreenWidth(2)),
                                      child: Icon(
                                        color: Color.fromARGB(200, 49, 49, 49),
                                        Icons.arrow_forward,
                                        size: getScreenWidth(30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
