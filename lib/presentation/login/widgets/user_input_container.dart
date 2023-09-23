import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/signup/signup_bloc.dart';
import 'package:karteikarten/core/failures/auth_failures.dart';
import 'package:karteikarten/shared/constant.dart';
import 'app_headline.dart';
import 'blur_button.dart';

class UserInputContainer extends StatefulWidget {
  const UserInputContainer({super.key});

  @override
  State<UserInputContainer> createState() => _UserInputContainerState();
}

class _UserInputContainerState extends State<UserInputContainer> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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

  String mapFailureMessage(AuthFailure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server failure. Please try agan!";
      case EmailAlreadyInUseFailure:
        return "Email already in use";
      case InvalidEmailAndPasswordFailure:
        return "Invalid email or password";
      default:
        return "Something went wrong";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        state.authFailuresOrSuccessOption.fold(
            () => {},
            (failOrSuccess) => failOrSuccess.fold((failure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(mapFailureMessage(failure)),
                    backgroundColor: Colors.red,
                  ));
                }, (success) => print("Login !!!!!!!!!!!!!!!!!!!!")));
      },
      builder: (context, state) {
        return Column(
          children: [
            const AppHeadline(),
            Form(
              key: formKey,
              child: Expanded(
                flex: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(padding_15),
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
                        borderRadius: BorderRadius.circular(padding_15),
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
                              controller: _emailController,
                              maxLength: 24,
                              maxLines: 1,
                              textAlignVertical: TextAlignVertical.bottom,
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8)),
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
                              controller: _passwordController,
                              maxLength: 24,
                              maxLines: 1,
                              obscureText: true,
                              textAlignVertical: TextAlignVertical.bottom,
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8)),
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
            ),
            const SizedBox(height: padding_20),
            if (!state.isSubmitting) ...[
              //TODO Progress Indicator Button
              BlurButton(
                buttonText: loginText,
                divisionFactor: 1.5,
                function: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SignupBloc>(context).add(
                        LoginWithEmailAndPasswordPressed(
                            email: _emailController.text,
                            password: _passwordController.text));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("Invalid ''User name'' or ''password'' Input"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
              ),
              SizedBox(height: size.width / 20),
              BlurButton(
                buttonText: forgottenPwText,
                divisionFactor: 1.5,
                function: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Password reset pressed'),
                    content: const Text('Forgotten password is at the moment not implemented'),
                    actions: <Widget>[                      
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            if (state.isSubmitting) ...[
              const SizedBox(height: padding_50),
              //TODO Progress gegen ein geiles Austauschen
              Expanded(
                  flex: 1,
                  child: CircularProgressIndicator(
                    color: Colors.white.withOpacity(.7),
                  ))
            ],
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlurButton(
                    buttonText: createNewAccountText,
                    divisionFactor: 2,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SignupBloc>(context).add(
                            RegisterWithEmailAndPasswordPressed(
                                email: _emailController.text,
                                password: _passwordController.text));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Invalid ''User name'' or ''password'' Input"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                  ),
                  SizedBox(height: size.height * .05),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
