import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/controller/controller_bloc.dart';
import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/domain/entities/index_card_entity.dart';
import 'package:karteikarten/service/injection.dart';
import 'package:karteikarten/shared/animated_signup_background.dart';
import 'package:karteikarten/shared/blur_button.dart';
import 'package:karteikarten/shared/blur_effect.dart';
import 'package:karteikarten/shared/constant.dart';
import 'package:karteikarten/shared/input_text_form_field.dart';

class ConfigIndexcardPage extends StatefulWidget {
  final DeckEntity deckEntity;
  const ConfigIndexcardPage({super.key, required this.deckEntity});

  @override
  State<ConfigIndexcardPage> createState() => _ConfigIndexcardPageState();
}

class _ConfigIndexcardPageState extends State<ConfigIndexcardPage> {
  final TextEditingController _fondside = TextEditingController();
  final TextEditingController _backside = TextEditingController();
  final TextEditingController _tag = TextEditingController();
  
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _backside.dispose();
    _fondside.dispose();
    _tag.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new Indexcard"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => serviceLocator<ControllerBloc>(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              //TODO
              //const AnimatedBackground(),
              Form(                
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: padding_50),
                      BlurEffect(
                        child: Container(
                          height: size.width,
                          width: size.width * .9,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: size.width / 30),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.05),
                            borderRadius: BorderRadius.circular(padding_15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InputTextFormField(
                                  controller: _fondside,
                                  labelText: "Fondside",
                                  icons: null,
                                  showIcon: true),
                              InputTextFormField(
                                  controller: _backside,
                                  labelText: "Backside",
                                  icons: null,
                                  showIcon: true),
                              InputTextFormField(
                                  controller: _tag,
                                  labelText: "Tag",
                                  icons: null,
                                  showIcon: true),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: padding_20),
                      BlocBuilder<ControllerBloc, ControllerState>(
                          builder: (context, state) {
                        if (state is ControllerInitial) {
                          return BlurButton(
                              buttonText: "Create",
                              divisionFactor: 2,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<ControllerBloc>(context).add(UpdateDeckEvent(deckEntity: widget.deckEntity.copyWith(indexcards: [IndexCardEntity(fondside: _fondside.text, backside: _backside.text, tag: _tag.text)])));
                                }
                              });
                        } else if (state is ControllerInProgress) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: padding_50,
                              ),
                              CircularProgressIndicator(
                                  color: Colors.white.withOpacity(.7)),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
