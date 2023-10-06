import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/controller/controller_bloc.dart';
import 'package:karteikarten/presentation/home/widgets/create_deck_dialog.dart';
import 'package:karteikarten/shared/blur_effect.dart';
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
      child: BlurEffect(
        child: Container(
          height: size.height / 8,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
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
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => CreateDialog(),
                          );
                        }),
                  ),
                  const Text(
                    "Create new Index Card Stack",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
        ),
      ),
    );
  }
}
