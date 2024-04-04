import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textFormField(
  TextEditingController ctlr, {
  bool readOnly = false,
  String label = "",
  String hint = '',
  int lines = 1,
  bool digits = false,
  int maxInputDigits = 9,
  bool needFocus = false,
  bool isRequried=false,
  TextInputType keyboardtype = TextInputType.text,
  int? maxLength,
  Function(String? value)? validateFunction,
  Function? onTap
}) {
  return TextFormField(
    autofocus: needFocus,
    maxLength: maxLength,
    validator: (value) {
      if (isRequried && (value==null || value.isEmpty)) {
        return '$label is Required';
      }
      if (validateFunction!=null) {
        return validateFunction(value);
      }
      return null;
    },
    onTap: () {
      if (onTap!=null) {
        onTap();
      }
    } ,
    controller: ctlr,
    keyboardType: keyboardtype,
    maxLines: lines,
    readOnly: readOnly,
    cursorColor: const Color.fromARGB(255, 8, 59, 100),
    inputFormatters: (digits)
        ? <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(maxInputDigits),
          ]
        : null,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        labelText:isRequried?'$label *': label,
        hintText: hint,
        hintStyle: const TextStyle( color:    Color.fromARGB(255, 8, 59, 100)),
        floatingLabelStyle: const TextStyle(color:  Color.fromARGB(255, 8, 59, 100)),
        filled: true,
        fillColor: (readOnly) ? Colors.grey : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color:  Color.fromARGB(255, 8, 59, 100)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color:  Color.fromARGB(255, 8, 59, 100)),
        )),
  );
}