import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';
import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/domain/entities/index_card_entity.dart';
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
  Color color1 = Colors.yellowAccent;
  Color color2 = Colors.indigoAccent;
  final double _initial = 0.2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn"),
      ),
      body: Column(
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
                      ));
                },
                cardController: controller,
                swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
                  if (align.x < 0) {
                    //Card is LEFT swiping
                    setState(() {
                      color1 = Colors.red;
                    });
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                    setState(() {
                      color1 = Colors.green;
                    });
                  } else if(align.x == 0){
                    setState(() {
                      color1 = Colors.black;
                    });
                  }
                },
                swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
                  /// Get orientation & index of swiped card!
                  if (orientation.name == "RIGHT") {
                    print("Rechts");
                  } else if (orientation.name == "LEFT") {
                    print("Links");
                  } else if(orientation.name == "RECOVER"){
                    setState(() {
                      color1 = Colors.black;
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
              Icon(Icons.thumb_down, color: Colors.red, size: padding_30),
              SizedBox(width: padding_20),
              Icon(Icons.thumb_up, color: Colors.green, size: padding_30),
            ],
          ),
          const SizedBox(height: padding_50),
          SizedBox(
            width: size.width - padding_20,
            child: LinearProgressIndicator(
              backgroundColor: Colors.deepPurple,
              valueColor: const AlwaysStoppedAnimation(Colors.green),
              minHeight: padding_15,
              value: _initial,
            ),
          )
        ],
      ),
    );
  }

  topWidget(IndexCardEntity indexcard) {
    return Container(
      alignment: Alignment.center,
      color: color1,
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
