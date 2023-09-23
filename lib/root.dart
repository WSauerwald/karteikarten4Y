import 'package:flutter/material.dart';
import 'package:karteikarten/presentation/login/signup_page.dart';

Map<String, WidgetBuilder> pageRoots(){
  return <String, WidgetBuilder>{
    "/signupPage" :(context) => const SignupPage(),
    //"/screen2" :(context) => const Screen2(),
  };
}