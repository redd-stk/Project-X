import 'package:flutter/material.dart';
import 'package:project_x/constants.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Stack(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 70,
                      backgroundColor: Color.fromARGB(255, 204, 203, 203),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 90,
                      top: 85,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.camera_alt,
                            color: appPrimaryColor,
                            size: 44,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 15),
                          Text("User Account Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 80, 79, 79))),
                        ],
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.edit, size: 20),
                        label: const Text(
                          "Edit",
                          style: TextStyle(fontSize: 14),
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
                        children: const [
                          Icon(
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 15),
                          Text("User Account email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 80, 79, 79))),
                        ],
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.edit, size: 20),
                        label: const Text(
                          "Edit",
                          style: TextStyle(fontSize: 14),
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
                        children: const [
                          Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 15),
                          Text("User Phone number",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 80, 79, 79))),
                        ],
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.edit, size: 20),
                        label: const Text(
                          "Edit",
                          style: TextStyle(fontSize: 14),
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
                          children: const [
                            Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 15),
                            Text("Change Account Password",
                                // _user.displayName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 80, 79, 79))),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 15),
                        Text("Back Home",
                            // _user.displayName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(255, 80, 79, 79))),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
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
                      children: const [
                        Icon(Icons.exit_to_app, color: Colors.red),
                        SizedBox(width: 10),
                        Text("Logout",
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
