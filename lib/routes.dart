import 'package:flutter/widgets.dart';

import 'screens/signInScreen/signInScreen.dart';
import 'screens/signUpScreen/SignUpScreen.dart';

final Map<String, WidgetBuilder> routes = {
  // OnboardingScreen.routeName: (context) => OnboardingScreen(),
  // ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
};
