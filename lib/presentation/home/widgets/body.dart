import 'package:flutter/material.dart';
import 'package:karteikarten/shared/animated_home.dart';
import 'package:karteikarten/shared/animated_home_background.dart';

class IndexCardOverview extends StatefulWidget {
  const IndexCardOverview({super.key});

  @override
  State<IndexCardOverview> createState() => _IndexCardOverviewState();
}

class _IndexCardOverviewState extends State<IndexCardOverview> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedHomeBackground(),
      ],
    );
  }
}