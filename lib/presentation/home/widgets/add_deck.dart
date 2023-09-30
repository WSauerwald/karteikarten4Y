import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:karteikarten/presentation/create_new_deck/create_new_deck.dart';
import 'package:karteikarten/shared/constant.dart';

class AddDeck extends StatelessWidget {
  const AddDeck({super.key});

  final Color color1 = const Color.fromARGB(255, 237, 140, 30);
  final Color color2 = const Color.fromARGB(255, 184, 69, 69);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(padding_15),
      child: ClipRRect(
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
              color: Colors.white.withOpacity(.3),
              borderRadius: BorderRadius.circular(padding_15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.circular(padding_50),
                      border: Border.all(width: 1)),
                  child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (context, animation, _) {
                              return const CreateNewDeck();
                            },
                            opaque: false));
                      }),
                ),
                const Text(
                  "Create new Index Card Stack",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}