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
      appBar: AppBar(
        title: const Text("Create a new Deck"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1900),
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
                            center: const FractionalOffset(
                                0.13, 0.1) // Position der Buttons Finden
                            )
                        .createShader(rect);
                  },
                  child: child,
                );
              });
        },
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 400,
          color: Color.fromARGB(255, 5, 184, 20),
        ),
        Container(
          height: 200,
          width: 400,
          color: Colors.purpleAccent,
        ),
        Container(
          height: 200,
          width: 400,
          color: Color.fromARGB(255, 11, 59, 189),
        ),
        Container(
          height: 100,
          width: 400,
          color: Color.fromARGB(255, 231, 68, 9),
        ),
      ],
    );
  }
}
