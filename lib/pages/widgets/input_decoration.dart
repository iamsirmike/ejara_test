import 'package:flutter/material.dart';

InputDecoration filledInputDecoration({
  String? label,
  String? hint,
  String? helperText,
  Widget? suffixText,
  Widget? suffixIcon,
  String? prefixText,
}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    hintStyle: TextStyle(color: Color(0xffAAAAAA), fontWeight: FontWeight.normal),
    helperText: helperText,
    prefixText: prefixText,
    suffix: suffixText,
    suffixIcon: suffixIcon,
    suffixStyle: TextStyle(color: Colors.black),
    labelStyle: TextStyle(color: Color(0xff9A9A9A)),
    errorStyle: TextStyle(),
    filled: true,
    fillColor: Color(0xFFF5F5F5),
    errorMaxLines: 4,
    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: Color(0xff720D5D),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: Color(0xff720D5D),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
  );
}
