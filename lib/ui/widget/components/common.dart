import 'package:flutter/material.dart';

class Common{
  TextFormField userName(
       {String labelValue = "",
         String hintValue = "",
         bool? validation,
         TextEditingController? controller,
         TextInputType keyboardType = TextInputType.text,
         TextStyle? textStyle,
         String? validationError,
         bool obscureText = false,
         bool isReadOnly = false,
         Widget? icons,
         FocusNode? fn,
         VoidCallback? callBackSearch,
         VoidCallback? callback
       }) {
    TextFormField textFormField = TextFormField();
    return textFormField;
  }
}