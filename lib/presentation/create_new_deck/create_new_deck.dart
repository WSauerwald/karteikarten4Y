import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/create_new_deck/create_new_deck_bloc.dart';
import 'package:karteikarten/presentation/login/widgets/blur_button.dart';
import 'package:karteikarten/service/injection.dart';
import 'package:karteikarten/shared/constant.dart';
import 'package:karteikarten/shared/input_text_form_field.dart';

class CreateNewDeck extends StatefulWidget {
  const CreateNewDeck({super.key});

  @override
  State<CreateNewDeck> createState() => _CreateNewDeckState();
}

class _CreateNewDeckState extends State<CreateNewDeck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a new Deck"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1900),
              child: Test(),
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

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final TextEditingController _deckNamecontroller = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _deckNamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => serviceLocator<CreateNewDeckBloc>(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: padding_50),
            Form(
              key: formKey,
              child: Center(
                child: Container(
                  height: size.width,
                  width: size.width * .95,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: size.width / 30),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(padding_15),
                  ),
                  child: Column(
                    children: [
                      InputTextFormField(
                          controller: _deckNamecontroller,
                          icons: Icons.account_circle,
                          labelText: "Deck Name"),                      
                      const SizedBox(
                        height: padding_20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: padding_20,
            ),
            BlocBuilder<CreateNewDeckBloc, CreateNewDeckState>(
              builder: (context, state) {
                if (state is CreateNewDeckInitial) {
                  return BlurButton(
                      buttonText: "Create",
                      divisionFactor: 1.5,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<CreateNewDeckBloc>(context).add(
                              CreateNewDeckPressed(
                                  deckName: _deckNamecontroller.text));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Invalid Input"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      });
                } else if (state is CreateNewDeckLoading) {
                  return Column(
                      children: [
                        const SizedBox(height: padding_15),
                        CircularProgressIndicator(
                            color: Colors.white.withOpacity(.7)),
                      ],
                    );
                } else if (state is CreateNewDeckLoaded) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                  ));
                } else if (state is CreateNewDeckError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ));
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
