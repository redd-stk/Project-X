import 'package:flutter/material.dart';
import 'package:project_x/constants.dart';

import '../../size_config.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: getScreenHeight(100)),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: getScreenWidth(70),
                      backgroundColor: const Color.fromARGB(255, 204, 203, 203),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: getScreenWidth(90),
                      top: getScreenHeight(85),
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.camera_alt,
                            color: appPrimaryColor,
                            size: getScreenWidth(44),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: getScreenHeight(50)),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            size: getScreenWidth(32),
                            Icons.account_circle,
                            color: Colors.grey,
                          ),
                          SizedBox(width: getScreenWidth(10)),
                          Text("User Account Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(14),
                                  color:
                                      const Color.fromARGB(255, 80, 79, 79))),
                        ],
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.edit, size: getScreenWidth(18)),
                        label: Text(
                          "Edit",
                          style: TextStyle(fontSize: getScreenWidth(13)),
                        ),
                        onPressed: () {
                          // handle edit button press
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            size: getScreenWidth(25),
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          SizedBox(width: getScreenWidth(10)),
                          Text("User Account email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(14),
                                  color:
                                      const Color.fromARGB(255, 80, 79, 79))),
                        ],
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.edit, size: getScreenWidth(18)),
                        label: Text(
                          "Edit",
                          style: TextStyle(fontSize: getScreenWidth(13)),
                        ),
                        onPressed: () {
                          // handle edit button press
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            size: getScreenWidth(26),
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          SizedBox(width: getScreenWidth(10)),
                          Text("User Phone number",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(14),
                                  color:
                                      const Color.fromARGB(255, 80, 79, 79))),
                        ],
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.edit, size: getScreenWidth(18)),
                        label: Text(
                          "Edit",
                          style: TextStyle(fontSize: getScreenWidth(13)),
                        ),
                        onPressed: () {
                          // handle edit button press
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              size: getScreenWidth(26),
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            SizedBox(width: getScreenWidth(10)),
                            Text("Change Account Password",
                                // _user.displayName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getScreenWidth(14),
                                    color:
                                        const Color.fromARGB(255, 80, 79, 79))),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 119, 119, 119),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: getScreenHeight(70),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getScreenWidth(30)),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 224, 224, 224)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.exit_to_app, color: Colors.red),
                          SizedBox(width: getScreenHeight(10)),
                          Text("Logout",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: getScreenWidth(15))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getScreenHeight(30)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getScreenWidth(85)),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(175, 243, 242, 242)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: getScreenWidth(28),
                            Icons.home,
                            color: Colors.grey,
                          ),
                          SizedBox(width: getScreenHeight(10)),
                          Text("Back Home",
                              // _user.displayName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenHeight(15),
                                  color:
                                      const Color.fromARGB(255, 80, 79, 79))),
                          SizedBox(width: getScreenHeight(5)),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
