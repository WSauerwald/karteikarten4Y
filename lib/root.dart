import 'package:flutter/material.dart';
import 'package:karteikarten/presentation/config_indexcard/config_indexcard.dart';
import 'package:karteikarten/presentation/home/home_page.dart';
import 'package:karteikarten/presentation/login/signup_page.dart';

Map<String, WidgetBuilder> pageRoots() {
  return <String, WidgetBuilder>{
    "/signupPage": (context) => const SignupPage(),
    "/home": (context) => HomePage(),
  };
}
