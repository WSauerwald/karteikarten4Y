import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:karteikarten/shared/constant.dart';

class DeckWidget extends StatelessWidget {
  const DeckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.circular(padding_15),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 15,
            sigmaX: 15,
          ),
          child: Container(
            height: size.height / 8,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.5),
              borderRadius: BorderRadius.circular(padding_15),
            ),
            child: ,
          ),
        ),
      );
  }
}