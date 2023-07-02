import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final String? Function(String? value) validator;

  const TextForm({
    super.key,
    this.isPass = false,
    required this.hintText,
    required this.textEditingController,
    required this.textInputType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: EdgeInsets.all(8.0),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
