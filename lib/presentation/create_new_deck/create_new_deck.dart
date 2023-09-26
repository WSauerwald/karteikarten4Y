import 'package:flutter/material.dart';

class CreateNewDeck extends StatefulWidget {
  const CreateNewDeck({super.key});

  @override
  State<CreateNewDeck> createState() => _CreateNewDeckState();
}

class _CreateNewDeckState extends State<CreateNewDeck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text("Create a new Deck"),),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1500),
                child: const Test(),
                builder: (context, value, child) {
                  return ShaderMask(
                    blendMode: BlendMode.modulate,
                    shaderCallback: (rect) {
                      return RadialGradient(
                              radius: value * 5,
                              colors: const [
                                Colors.white,
                                Colors.white,
                                Colors.transparent,
                                Colors.transparent
                              ],
                              stops: const [0.0, 0.55, 0.6, 1.0],
                              center: const FractionalOffset(0.13, 0.1) // Position der Buttons Finden 
                              )
                          .createShader(rect);
                    },
                    child: child,
                  );
                }),
          );
        },
      ),
    );
  }
}


class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
    );
  }
}