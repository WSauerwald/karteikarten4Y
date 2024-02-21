import 'package:flutter/material.dart';
import 'package:karteikarten/core/validators/email_validator.dart';
import 'package:karteikarten/core/validators/password_validator.dart';
import 'package:karteikarten/shared/constant.dart';

class EmailUserInput extends StatelessWidget {
  final TextEditingController controller;
  const EmailUserInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: padding_10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateEmail,
        controller: controller,
        maxLength: 40,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.bottom,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: TextStyle(color: Colors.white.withOpacity(.8)),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Colors.white.withOpacity(.7),
          ),
          labelText: userEmailText,
        ),
      ),
    );
  }
}

class PasswordUserInput extends StatelessWidget {
  final TextEditingController controller;
  const PasswordUserInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: padding_10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validatePassword,
        controller: controller,
        maxLength: 32,
        maxLines: 1,
        obscureText: true,
        textAlignVertical: TextAlignVertical.bottom,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: TextStyle(color: Colors.white.withOpacity(.8)),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.white.withOpacity(.7),
          ),
          labelText: userPasswordText,
        ),
      ),
    );
  }
}

class EmailResetInput extends StatelessWidget {
  final TextEditingController controller;
  const EmailResetInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: padding_10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateEmail,
        controller: controller,
        maxLength: 40,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.bottom,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Colors.white.withOpacity(.7),
          ),
          labelText: userEmailText,
        ),
      ),
    );
  }
}
