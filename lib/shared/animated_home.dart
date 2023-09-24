import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

class AnimatedHomeBackground extends StatelessWidget {
  const AnimatedHomeBackground({super.key});

  final Color smalt = const Color(0xff121856);
  final Color oldRose = const Color(0xffD23756);

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      // duration: const Duration(seconds: 3),
      primaryBegin: Alignment.topCenter,
      primaryEnd: Alignment.bottomCenter,
      secondaryBegin: Alignment.bottomCenter,
      secondaryEnd: Alignment.topCenter,
      primaryColors:  [
        smalt.withOpacity(.8),
        oldRose.withOpacity(.6),
        smalt.withOpacity(.4),
      ],
      secondaryColors:  [
        smalt.withOpacity(.8),
        oldRose.withOpacity(.6),
        smalt.withOpacity(.4),
      ],
    );
  }
}