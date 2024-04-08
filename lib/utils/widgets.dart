import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'function.dart';

Widget textFormField(
   {
  TextEditingController? ctlr,
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
  Function(String value)? onChanged,
  String? initialValue
  // Function? onTap
}) {
  return TextFormField(
    autofocus: needFocus,
    initialValue: initialValue,
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
    onChanged: (value) {
      if (onChanged!=null) {
        onChanged(value);
      }
    },
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

Widget commonWidget(first, second){
    const paddingStyle = EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0);
    const lableStyle = TextStyle(fontFamily: 'rebot', fontWeight: FontWeight.w500, fontSize: 14);
    const valueStyle = TextStyle(fontFamily: 'rebot', fontSize: 14);
      
      return Padding(
        padding: paddingStyle,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(
                  '$first',
                  style: lableStyle),
              Expanded(
                child: Text(
                  nullConvertor(second),
                  style: valueStyle,
                  textAlign: TextAlign.right,
                ),
              ),
            ]),
        );
    }
Widget cardDesign({Widget? child,double radius = 3.0,Color cardCol =Colors.white, double elevation = 4.0,double horizontal= 5.0,double vertical= 3.0}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: Card(
      color: cardCol,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: elevation,
      child: child,
    ),
  );
}
