import 'package:flutter/material.dart';
import 'package:karteikarten/shared/blur_effect.dart';


  class BlurButton extends StatelessWidget {
  final String buttonText;
  final double divisionFactor;
  final VoidCallback function;
  const BlurButton({super.key, required this.buttonText, required this.divisionFactor, required this.function});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlurEffect(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: function,
        child: Container(
          height: size.width / 8,
          width: size.width / divisionFactor,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white.withOpacity(.8)),
          ),
        ),
      ),
    );
  }
}