import 'package:flutter/material.dart';
import 'package:karteikarten/application/signup/signup_bloc.dart';
import 'package:karteikarten/service/injection.dart';
import '../../shared/animated_signup_background.dart';
import 'widgets/user_input_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
        create: (context) => serviceLocator<SignupBloc>(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: const Stack(
              children: [AnimatedBackground(), UserInputContainer()],
            ),
          ),
        ),
      ),
    );
  }
}
