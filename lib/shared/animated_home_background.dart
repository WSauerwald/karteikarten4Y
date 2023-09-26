import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

class AnimatedHomeBackground extends StatefulWidget {
  const AnimatedHomeBackground({super.key});

  @override
  State<AnimatedHomeBackground> createState() => _AnimatedHomeBackgroundState();
}

class _AnimatedHomeBackgroundState extends State<AnimatedHomeBackground> {
  final Color smalt = Color.fromARGB(255, 0, 0, 0);

  final Color oldRose = Color.fromARGB(255, 54, 54, 54);

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryColors:  [
        smalt.withOpacity(.8),
        smalt.withOpacity(.6),
        smalt.withOpacity(.4),
      ],
      secondaryColors:  [
        oldRose.withOpacity(.8),
        oldRose.withOpacity(.6),
        oldRose.withOpacity(.4),
      ],
    );
  }
}