import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/signup/signup_bloc.dart';
import 'package:karteikarten/core/failures/map/map_failures.dart';
import 'package:karteikarten/presentation/login/widgets/dialog.dart';
import 'package:karteikarten/presentation/login/widgets/text_form_field.dart';
import 'package:karteikarten/shared/constant.dart';
import 'app_headline.dart';
import 'blur_button.dart';

class UserInputContainer extends StatefulWidget {
  const UserInputContainer({super.key});

  @override
  State<UserInputContainer> createState() => _UserInputContainerState();
}

class _UserInputContainerState extends State<UserInputContainer> {
  final TextEditingController _emailResetController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailResetController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                }, (success) async {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Account has been created"),
                    backgroundColor: Colors.green,
                  ));
                  await Future.delayed(const Duration(seconds: 2));
                  //TODO navigation home Page
                }));
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
                          EmailUserInput(controller: _emailController),
                          PasswordUserInput(controller: _passwordController),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: padding_20),
            if (!state.isSubmitting) ...[
              //TODO eventuelle umstellung auf Progress Button
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
                  builder: (BuildContext context) => ResetPasswortDialog(controller: _emailResetController),
                ),
              ),
            ],
            if (state.isSubmitting) ...[
              const SizedBox(height: padding_50),
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
