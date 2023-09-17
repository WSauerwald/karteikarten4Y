import 'package:flutter/material.dart';
import 'package:karteikarten/application/signup/signup_bloc.dart';
import 'package:karteikarten/service/injection.dart';
import 'package:karteikarten/shared/constant.dart';
import '../../shared/animated_background.dart';
import 'widgets/app_headline.dart';
import 'widgets/blur_button.dart';
import 'widgets/user_input_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: BlocProvider(
        create: (context) => serviceLocator<SignupBloc>(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                const AnimatedBackground(),
                Column(
                  children: [
                    const AppHeadline(),
                    //ToDo inputController
                    UserInputContainer(
                        emailController: emailController,
                        passwordController: passwordController),
                    const SizedBox(height: padding_20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlurButton(
                          buttonText: loginText,
                          divisionFactor: 2.5,
                          function: () {
                            if (checkControllerInput(
                                    passwordController.text, false) ||
                                checkControllerInput(
                                    emailController.text, true)) {
                              print("OK");
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "Invalid ''User name'' or ''password'' Inputs"),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool checkControllerInput(String input, bool isEmail) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (isEmail && RegExp(emailRegex).hasMatch(input)) {
    return true;
  } else if (input.isEmpty) {
    return false;
  } else if (input.length < 6) {
    return false;
  } else {
    return true;
  }
}
