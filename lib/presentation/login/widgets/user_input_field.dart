import 'package:flutter/material.dart';
import 'package:karteikarten/shared/constant.dart';

class UserInputField extends StatelessWidget {
  final IconData icon;
  final String lableText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;
  const UserInputField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.lableText,
      required this.isPassword,
      required this.isEmail});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    String? validateEmail(String? input) {
      const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
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
      } else if(input.length >= 6) {
        return null;
      }
      else{
        return "short password";
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: padding_10),
      child: TextFormField(        
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: isEmail ? validateEmail : validatePassword,
        controller: controller,
        maxLength: 24,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.bottom,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: TextStyle(color: Colors.white.withOpacity(.8)),
        cursorColor: Colors.white,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.7),
          ),
          labelText: lableText,
        ),
      ),
    );
  }
}
