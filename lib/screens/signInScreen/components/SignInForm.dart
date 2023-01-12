import 'package:flutter/material.dart';
import 'package:project_x/constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(height: 48, child: emailFormField()),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(height: 48, child: passwordFormField()),
          ),
        ],
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
        controller: _emailField,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onSaved: (newValue) => email = newValue!,
        decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: 18,
              color: appPrimaryColor,
              fontWeight: FontWeight.bold),
          hintStyle: TextStyle(fontSize: 14),
          labelText: "Email",
          hintText: "Enter Your Email address",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }

  TextFormField passwordFormField() {
    return TextFormField(
        cursorColor: appPrimaryColor,
        controller: _passwordField,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        textInputAction: TextInputAction.done,
        onSaved: (newValue) => password = newValue!,
        decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: 18,
              color: appPrimaryColor,
              fontWeight: FontWeight.bold),
          labelText: "Password",
          hintStyle: TextStyle(fontSize: 14),
          hintText: "Enter Your Password",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }
}
