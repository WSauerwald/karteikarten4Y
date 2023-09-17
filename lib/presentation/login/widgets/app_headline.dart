import 'package:flutter/material.dart';
import 'package:karteikarten/shared/constant.dart';

class AppHeadline extends StatelessWidget {
  const AppHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .1),
        child: Text(
          appName,
          style: TextStyle(
            color: Colors.white.withOpacity(.7),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            wordSpacing: 4,
          ),
        ),
      ),
    );
  }
}
