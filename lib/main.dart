import 'package:crockery_app/AppScreens/Admin/Home/HomeScreen.dart';
import 'package:crockery_app/AppScreens/Client/Details/DetailsScreen.dart';
import 'package:crockery_app/AppScreens/WelcomeScreens/SplashScreen.dart';
import 'package:crockery_app/AppScreens/WelcomeScreens/LoginScreen.dart';
import 'package:crockery_app/AppScreens/WelcomeScreens/SignUpScreen.dart';

import 'package:flutter/material.dart';

import 'AppScreens/Admin/Store/NewStores.dart';
import 'AppScreens/Client/Home/ClientHomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewStores(),
    );
  }
}


