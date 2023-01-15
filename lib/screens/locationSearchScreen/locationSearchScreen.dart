import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import 'components/location_list_tile.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  bool mPesa = true;
  bool cash = false;
  late String _mpesaNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromARGB(255, 95, 94, 94)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          "New Trip",
          style: TextStyle(color: Color.fromARGB(255, 95, 94, 94)),
        ),
        // actions: [
        //   CircleAvatar(
        //     backgroundColor: secondaryColor10LightTheme,
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.close, color: Colors.black),
        //     ),
        //   ),
        //   const SizedBox(width: defaultPadding)
        // ],
      ),
      body: Column(
        children: <Widget>[
          const Text(
            "Set Your Desination",
            style: TextStyle(
              color: appPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: TextFormField(
                onChanged: (value) {},
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    hintText: "Search your destination location",
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: SvgPicture.asset(
                        "assets/icons/location.svg",
                        height: 16,
                        color: Color.fromARGB(255, 143, 141, 141),
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
          const SizedBox(height: 50),
          const Text(
            "Select Payment Method",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: appPrimaryColor),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: <Widget>[
              Checkbox(
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
          const SizedBox(height: 25),
          mPesa
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Your Mpesa Number",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: appPrimaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: appPrimaryColor)),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    onChanged: (value) {
                      setState(() {
                        _mpesaNumber = value;
                      });
                    },
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
          cash
              ? const Text("Ensure you pay before alighting",
                  style: TextStyle(fontSize: 15, color: Colors.red))
              : Container(),
        ],
      ),
    );
  }

  Container commonLocations(location) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: secondaryColor10LightTheme,
          foregroundColor: appPrimaryColor,
          elevation: 0,
          fixedSize: const Size(double.infinity, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: Text(location,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
