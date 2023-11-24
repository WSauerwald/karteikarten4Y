import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';
import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/domain/entities/index_card_entity.dart';
import 'package:karteikarten/shared/animated_signup_background.dart';
import 'package:karteikarten/shared/constant.dart';

class IndexcardPage extends StatefulWidget {
  final DeckEntity deck;
  const IndexcardPage({super.key, required this.deck});

  @override
  State<IndexcardPage> createState() => _IndexcardPageState();
}

class _IndexcardPageState extends State<IndexcardPage>
    with TickerProviderStateMixin {
  CardController controller = CardController();
  Color frondsideColor = Colors.yellowAccent;
  Color backsideColor = Colors.indigoAccent;
  int currentIndex = 0;
  int progressColorIndex = 0;

  List<int> colorIndex = [];

  List<Color> stepColors = [
    Colors.red,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn"),
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          Column(
            children: [
              const SizedBox(height: padding_50),
              Center(
                child: SizedBox(
                  height: size.width * 0.9,
                  width: size.width * 0.9,
                  child: SwipeCard(
                    totalNum: widget.deck.indexcards.length,
                    maxWidth: size.width * 0.8,
                    maxHeight: size.width * 0.8,
                    minWidth: size.width * 0.79,
                    minHeight: size.width * 0.79,
                    cardBuilder: (context, index) {
                      return Card(
                          color: Colors.transparent,
                          shadowColor: Colors.transparent,
                          child: FlipCard(
                            front: topWidget(widget.deck.indexcards[index]),
                            back: bottomWidget(widget.deck.indexcards[index]),
                            side: CardSide.FRONT,
                          ));
                    },
                    cardController: controller,
                    swipeUpdateCallback:
                        (DragUpdateDetails details, Alignment align) {
                      if (align.x < 0.2) {
                        //Card is LEFT swiping
                        setState(() {
                          frondsideColor = Colors.red;
                        });
                      } else if (align.x > 0) {
                        //Card is RIGHT swiping
                        setState(() {
                          frondsideColor = Colors.green;
                        });
                      } else if (align.x == 0) {
                        setState(() {
                          frondsideColor = Colors.black;
                        });
                      }
                    },
                    swipeCompleteCallback:
                        (CardSwipeOrientation orientation, int index) {
                      /// Get orientation & index of swiped card!
                      if (orientation.name == "RIGHT") {
                        setState(() {
                          frondsideColor = Colors.black;
                          if (currentIndex < stepColors.length) {
                            currentIndex++;
                            colorIndex.add(1);
                          }
                        });
                      } else if (orientation.name == "LEFT") {
                        setState(() {
                          frondsideColor = Colors.black;
                          if (currentIndex < stepColors.length) {
                            currentIndex++;
                            colorIndex.add(0);
                          }
                        });
                      } else if (orientation.name == "RECOVER") {
                        setState(() {
                          frondsideColor = Colors.black;
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: padding_20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.thumb_down, color: Colors.red, size: padding_50),
                  SizedBox(width: padding_20),
                  Icon(Icons.thumb_up, color: Colors.green, size: padding_50),
                ],
              ),
              const SizedBox(height: padding_50),
              SizedBox(
                width: size.width - padding_20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      List.generate(widget.deck.indexcards.length, (index) {
                    return Expanded(
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: index < currentIndex
                              ? stepColors[colorIndex[index]]
                              : Colors.grey[300],
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  topWidget(IndexCardEntity indexcard) {
    return Container(
      alignment: Alignment.center,
      color: frondsideColor,
      child: Text(
        indexcard.fondside,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  bottomWidget(IndexCardEntity indexcard) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: Text(
        indexcard.backside,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
