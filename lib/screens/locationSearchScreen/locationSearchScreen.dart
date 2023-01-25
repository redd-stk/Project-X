import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_x/extra%20components/defaultButton.dart';
import 'package:project_x/extra%20components/networkUtils/networkUtilis.dart';
import 'package:project_x/screens/mapScreen/mapScreen3.dart';

import '../../constants.dart';
import '../PaymentScreen/paymentScreen.dart';
import '../mapScreen/mapScreen2.dart';
import 'components/location_list_tile.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key, this.pressed}) : super(key: key);
  final VoidCallback? pressed;

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  bool mPesa = true;
  bool cash = false;
  late String _mpesaNumber;

  void placesAutocomplete(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        'maps/api/place/autocomplete/json',
        {"input": query, "key": googleApiKey});

    String? response = await NetworkUtils.fetchUrl(uri);

    if (response != null) {
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(197, 219, 219, 219),
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: appPrimaryColor,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromARGB(255, 95, 94, 94)),
          onPressed: () {
            // _checkLocationPermissionAndGetCurrentLocation();
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          "New Trip",
          style: TextStyle(color: Color.fromARGB(255, 95, 94, 94)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              "Set Your Desination",
              style: TextStyle(
                color: appPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 200,
                width: 375,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 211, 210, 210)),
                child: const MapScreen3(),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                child: TextFormField(
                  onChanged: (value) {
                    placesAutocomplete(value);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      hintText: "Search your destination location",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: SvgPicture.asset(
                          "assets/icons/location.svg",
                          height: 16,
                          color: const Color.fromARGB(255, 143, 141, 141),
                        ),
                      )),
                ),
              ),
            ),
            const Divider(
              height: 6,
              thickness: 2.5,
              color: secondaryColor5LightTheme,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    commonLocations("KFA"),
                    commonLocations("Rafiki"),
                    commonLocations("Kabu Main Gate"),
                    commonLocations("Kiamunyi"),
                    commonLocations("Kampi Ya Moto"),
                    commonLocations("Mercy Njeri"),
                    commonLocations("Barkesen"),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 4,
              thickness: 2.5,
              color: secondaryColor5LightTheme,
            ),
            LocationListTile(
              press: () {},
              location: "Kabarak, Nakuru, Kenya",
            ),
            Container(),
            const SizedBox(height: 20),
            const Text(
              "Select Payment Method",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: appPrimaryColor),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: <Widget>[
                Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: mPesa,
                  onChanged: (value) {
                    setState(() {
                      mPesa = value!;
                      cash = false;
                    });
                  },
                ),
                const Text(
                  "Mpesa Transaction",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 30),
                Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: cash,
                  onChanged: (value) {
                    setState(() {
                      mPesa = false;
                      cash = value!;
                    });
                  },
                ),
                const Text(
                  "Cash Money",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            const SizedBox(height: 15),
            mPesa
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                top: 9, bottom: 9, left: 20),
                            labelText: "Enter Your Mpesa Number",
                            labelStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: appPrimaryColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: appPrimaryColor)),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          onChanged: (value) {
                            setState(() {
                              _mpesaNumber = value;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 55, right: 55, top: 10, bottom: 10),
                          child: DefaultButton(
                            pressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QRScanScreen1()));
                            },
                            text: "Continue to Payment",
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
            cash
                ? Column(
                    children: [
                      const Text(
                          "!! Ensure you pay your cash before alighting !!",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 100, right: 100, top: 35, bottom: 10),
                        child: DefaultButton(
                          pressed: () {},
                          text: "Finish",
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Container commonLocations(location) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          placesAutocomplete("Dubai");
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: secondaryColor10LightTheme,
          foregroundColor: appPrimaryColor,
          elevation: 0,
          fixedSize: const Size(double.infinity, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: Text(location,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
