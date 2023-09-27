import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karteikarten/presentation/home/home_page.dart';
import 'package:karteikarten/presentation/login/signup_page.dart';
import 'package:karteikarten/root.dart';
import 'package:karteikarten/service/injection.dart' as di;
import 'package:karteikarten/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyALTsWm-1MOqfh7TxAk6tIAuN01-DRLEmM",
          appId: "1:380238333008:android:26a68eb5278ad4c4697d55",
          messagingSenderId: "380238333008",
          projectId: "karteikarten-bc2f0"));
  await di.init();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: pageRoots(),
      theme: AppTheme.darkTheme,
      home: const SignupPage(),
      title: "Karteikarten",
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}
