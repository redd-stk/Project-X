import 'package:flutter/material.dart';
import 'package:project_x/constants.dart';

import '../../size_config.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          const Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                          ),
                          SizedBox(width: getScreenWidth(15)),
                          Text("User Account Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(15),
                                  color:
                                      const Color.fromARGB(255, 80, 79, 79))),
                        ],
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.edit, size: getScreenWidth(20)),
                        label: Text(
                          "Edit",
                          style: TextStyle(fontSize: getScreenWidth(14)),
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
                          const Icon(
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          SizedBox(width: getScreenWidth(15)),
                          Text("User Account email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(15),
                                  color:
                                      const Color.fromARGB(255, 80, 79, 79))),
                        ],
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.edit, size: getScreenWidth(20)),
                        label: Text(
                          "Edit",
                          style: TextStyle(fontSize: getScreenWidth(14)),
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
                          const Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          SizedBox(width: getScreenWidth(15)),
                          Text("User Phone number",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(15),
                                  color:
                                      const Color.fromARGB(255, 80, 79, 79))),
                        ],
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.edit, size: getScreenWidth(20)),
                        label: Text(
                          "Edit",
                          style: TextStyle(fontSize: getScreenWidth(14)),
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
                            const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            SizedBox(width: getScreenWidth(15)),
                            Text("Change Account Password",
                                // _user.displayName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getScreenWidth(15),
                                    color:
                                        const Color.fromARGB(255, 80, 79, 79))),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: getScreenHeight(30),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                        SizedBox(width: getScreenHeight(15)),
                        Text("Back Home",
                            // _user.displayName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getScreenHeight(15),
                                color: const Color.fromARGB(255, 80, 79, 79))),
                        SizedBox(width: getScreenHeight(10)),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getScreenHeight(50)),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 224, 224, 224)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.exit_to_app, color: Colors.red),
                        SizedBox(width: getScreenHeight(10)),
                        const Text("Logout",
                            style: TextStyle(color: Colors.red, fontSize: 16)),
                      ],
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
