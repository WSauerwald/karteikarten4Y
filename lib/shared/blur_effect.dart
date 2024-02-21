import 'dart:ui';

import 'package:flutter/material.dart';

import 'constant.dart';

class BlurEffect extends StatelessWidget {
  final Widget child;
  const BlurEffect({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                  borderRadius: BorderRadius.circular(padding_15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: 15,
                      sigmaX: 15,
                    ),
                    child: child,
                  )
    );
  }
}