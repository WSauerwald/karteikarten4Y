import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/signup/signup_bloc.dart';
import 'package:karteikarten/shared/constant.dart';
import 'app_headline.dart';
import 'blur_button.dart';

class UserInputContainer extends StatefulWidget {
  const UserInputContainer({super.key});

  @override
  State<UserInputContainer> createState() => _UserInputContainerState();
}

class _UserInputContainerState extends State<UserInputContainer> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? input) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    if (input == null || input.isEmpty) {
      return "please enter email";
    } else if (RegExp(emailRegex).hasMatch(input)) {
      return null;
    } else {
      return "invalid email format";
    }
  }

  String? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return "please enter email";
    } else if (input.length >= 6) {
      return null;
    } else {
      return "short password";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Column(
      children: [
        const AppHeadline(),
        BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state) {
            // TODO: navigate to a ather page
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Expanded(
                flex: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: 15,
                      sigmaX: 15,
                    ),
                    child: Container(
                      height: size.width,
                      width: size.width * .95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: size.width / 30),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: padding_10),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: validateEmail,
                              controller: emailController,
                              maxLength: 24,
                              maxLines: 1,
                              textAlignVertical: TextAlignVertical.bottom,
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              style:
                                  TextStyle(color: Colors.white.withOpacity(.8)),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white.withOpacity(.7),
                                ),
                                labelText: userEmailText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: padding_10),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: validatePassword,
                              controller: passwordController,
                              maxLength: 24,
                              maxLines: 1,
                              obscureText: true,
                              textAlignVertical: TextAlignVertical.bottom,
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              style:
                                  TextStyle(color: Colors.white.withOpacity(.8)),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white.withOpacity(.7),
                                ),
                                labelText: userPasswordText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: padding_20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlurButton(
              buttonText: loginText,
              divisionFactor: 2.5,
              function: () {
                if (formKey.currentState!.validate()) {
                  print("OK");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text("Invalid ''User name'' or ''password'' Inputs"),
                    backgroundColor: Colors.red,
                  ));
                }
              },
            ),
            SizedBox(width: size.width / 20),
            BlurButton(
              buttonText: forgottenPwText,
              divisionFactor: 2.5,
              function: () {},
            ),
          ],
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlurButton(
                buttonText: createNewAccountText,
                divisionFactor: 2,
                function: () {},
              ),
              SizedBox(height: size.height * .05),
            ],
          ),
        ),
      ],
    );
  }
}
