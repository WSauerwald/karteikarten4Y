import 'package:flutter/material.dart';
import 'package:karteikarten/core/validators/input_validator.dart';
import 'constant.dart';

class InputTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icons;
  final String labelText;
  final bool showIcon;
  const InputTextFormField({super.key, required this.controller, required this.icons, required this.labelText,required this.showIcon });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: padding_10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateInput,
        controller: controller,
        maxLength: 32,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.bottom,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: TextStyle(color: Colors.white.withOpacity(.8)),
        cursorColor: Colors.white,
        decoration: showIcon ? InputDecoration(
          prefixIcon: Icon(
            icons,
            color: Colors.white.withOpacity(.7),
          ),
          labelText: labelText,
        ) : null,
      ),
    );
  }
}