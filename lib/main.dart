import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karteikarten/presentation/login/login_page.dart';
import 'package:karteikarten/service/injection.dart' as di;
import 'package:karteikarten/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MaterialApp(
      theme: AppTheme.darkTheme,
      home: const LoginPage(),
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