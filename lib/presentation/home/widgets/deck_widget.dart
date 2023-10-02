import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/observer/observer_bloc.dart';
import 'package:karteikarten/shared/blur_effect.dart';
import 'package:karteikarten/shared/constant.dart';

class DeckWidget extends StatefulWidget {
  const DeckWidget({super.key});

  @override
  State<DeckWidget> createState() => _DeckWidgetState();
}

class _DeckWidgetState extends State<DeckWidget> {
  final Color color2 = const Color.fromARGB(255, 184, 69, 69);
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return BlocBuilder<ObserverBloc, ObserverState>(
      builder: (context, state) {
        if (state is ObserverInitial) {
          return Container();
        } else if (state is ObserverLoading) {
          return Column(
            children: [
              const SizedBox(
                height: padding_50,
              ),
              CircularProgressIndicator(color: Colors.white.withOpacity(.7)),
            ],
          );
        } else if (state is ObserverFailure) {
          //TODO fehler anzeigen
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Error by loading data!!!"),
            backgroundColor: Colors.red,
          ));          
        } else if (state is ObserverSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.deckEntity.length,
            itemBuilder: (BuildContext context, int index) {
              final deck = state.deckEntity[index];
              return BlurEffect(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: padding_15, right: padding_50),
                  height: size.height * .1,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(padding_15),
                  ),
                  child: InkWell(
                    onHighlightChanged: (value) {
                      setState(() {
                        isTapped = value;
                      });
                    },
                    onTap: () {
                      //TODO erstellung zu den Karteikarten
                      print("drücken auf Karteikarten Lernen");
                    },
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(deck.title),
                        const SizedBox(width: padding_50,),
                        AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: isTapped ? size.height * .06 : size.height * .07,
                          width: isTapped ? size.height * .06 : size.height * .07,
                          decoration: BoxDecoration(
                              color: color2,
                              borderRadius: BorderRadius.circular(padding_50),
                              border: Border.all(width: 1)),
                          child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                //TODO
                                print("Erstelle neue Karteikarte");
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
