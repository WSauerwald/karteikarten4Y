import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/resetPasswort/reset_passwort_bloc.dart';
import 'package:karteikarten/presentation/login/widgets/text_form_field.dart';
import 'package:karteikarten/service/injection.dart';
import 'package:karteikarten/shared/constant.dart';
import 'blur_button.dart';

class ResetPasswortDialog extends StatelessWidget {
  final TextEditingController controller;
  const ResetPasswortDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => serviceLocator<ResetPasswortBloc>(),
        child: AlertDialog(
          titleTextStyle:
              const TextStyle(color: Colors.white, fontSize: padding_20),
          contentTextStyle: const TextStyle(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 33, 33, 33),
          title: const Text('RESTE YOUR PASSWORT'),
          content: SizedBox(
            height: 220,
            child: Column(
              children: [
                const Text(
                    "To reset your password you must enter your email address. You will receive a link to change your password."),
                const SizedBox(
                  height: padding_20,
                ),
                BlocBuilder<ResetPasswortBloc, ResetPasswortState>(
                    builder: (context, state) {
                  if (state is ResetPasswortStateInit) {
                    return Column(
                      children: [
                        EmailResetInput(controller: controller),
                        const SizedBox(height: padding_10),
                        BlurButton(
                            buttonText: "Send E-mail",
                            divisionFactor: 1.5,
                            function: () {
                              BlocProvider.of<ResetPasswortBloc>(context).add(
                                  ForgottenPasswordPressed(
                                      email: controller.text));
                            })
                      ],
                    );
                  } else if (state is ResetPasswortStateLoading) {
                    return Column(
                      children: [
                        const SizedBox(height: padding_50,),
                        CircularProgressIndicator(
                            color: Colors.white.withOpacity(.7)),
                      ],
                    );
                  } else if (state is ResetPasswortStateLoaded) {
                    Navigator.pop(context);
                    WidgetsBinding.instance.addPostFrameCallback((_) {ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.green,
                    ));});
                  } else if (state is ResetPasswortStateError) {
                    Navigator.pop(context);
                    WidgetsBinding.instance.addPostFrameCallback((_) {ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.green,
                    ));});
                  }
                  return Container();
                }),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
