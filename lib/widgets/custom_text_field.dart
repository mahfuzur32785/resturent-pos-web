import 'package:flutter/material.dart';
import 'package:web/utils/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    this.callback,
    required this.text,
    this.isObscure = false,
    this.textInputAction,
    this.keyboardType,
    this.widget,
    this.color,
    this.borderColor,
    this.maxLine,
  });

  final TextEditingController textEditingController;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? callback;
  final String text;
  final Color? color;
  final Color? borderColor;
  final bool isObscure;
  final Widget? widget;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: callback,
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.next,
      enableSuggestions: true,
      obscureText: isObscure,
      autocorrect: false,
      maxLines: maxLine ?? 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: text,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            )),
        focusedErrorBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
