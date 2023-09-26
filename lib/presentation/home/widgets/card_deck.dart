import 'package:flutter/material.dart';
import 'package:karteikarten/presentation/home/widgets/add_deck.dart';
import 'package:karteikarten/shared/animated_home_background.dart';

class CardDeck extends StatefulWidget {
  const CardDeck({super.key});

  @override
  State<CardDeck> createState() => _CardDeckState();
}

class _CardDeckState extends State<CardDeck> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedHomeBackground(),
        Column(
          children: [
            AddDeck()
          ],
        )
      ],
    );
  }
}