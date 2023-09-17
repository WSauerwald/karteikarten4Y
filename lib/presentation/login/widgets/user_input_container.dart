import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/signup/signup_bloc.dart';
import 'package:karteikarten/shared/constant.dart';
import 'user_input_field.dart';

class UserInputContainer extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const UserInputContainer(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        // TODO: navigate to a ather page
      },
      builder: (context, state) {
        return Expanded(
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
                    UserInputField(
                        icon: Icons.email_outlined,
                        controller: emailController,
                        lableText: userEmailText,
                        isPassword: false,
                        isEmail: true),
                    UserInputField(
                        icon: Icons.lock_outline,
                        controller: passwordController,
                        lableText: userPasswordText,
                        isPassword: true,
                        isEmail: false),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
