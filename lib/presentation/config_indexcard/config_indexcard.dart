import 'package:flutter/material.dart';
import 'package:karteikarten/shared/animated_signup_background.dart';
import 'package:karteikarten/shared/blur_button.dart';
import 'package:karteikarten/shared/blur_effect.dart';
import 'package:karteikarten/shared/constant.dart';
import 'package:karteikarten/shared/input_text_form_field.dart';

class ConfigIndexcard extends StatelessWidget {
  ConfigIndexcard({super.key});

  final TextEditingController _fondside = TextEditingController();
  final TextEditingController _backside = TextEditingController();
  final TextEditingController _tag = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new Indexcard"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
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
                  BlurButton(
                      buttonText: "Create",
                      divisionFactor: 2,
                      function: () {
                        if (formKey.currentState!.validate()) {}
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
