import 'package:flutter/material.dart';
func() {}
Widget clearCancelApplyFunc(
    {Function cancelOnTap = func,
    required Function clearOnTap,
    required Function applyOnTap,
    double leftpadding = 15.0,
    double rightpadding = 15.0,
    double cancelHt = 48.0,
    double clearHt = 48.0,
    double applyHt = 48.0,
    String leftLableName = '',
    String rightLableName = '',
    double vdWidth = 65,
    Color cancelClr = Colors.green,
    Color clearClr = Colors.green,
    Color applyClr = Colors.green}) {
  return Padding(
    padding: EdgeInsets.only(left: leftpadding, right: rightpadding, bottom: 3),
    child: Row(children: [
      elevatedBtnFunc(
          fun: clearOnTap,
          buttonName: (leftLableName == '')
              ? 'Reset'
              : leftLableName,
          clr: clearClr,
          ht: clearHt),
      VerticalDivider(
        width: vdWidth,
        color: Colors.white,
      ),
      elevatedBtnFunc(
          fun: applyOnTap,
          buttonName: (rightLableName == '')
              ? 'Add'
              : rightLableName,
          clr: applyClr,
          ht: applyHt),
    ]),
  );
}
Widget elevatedBtnFunc({
  required Function fun,
  double ht = 48.0,
  bool switchColors = false,
  required String buttonName,
  Color clr = Colors.green,
  Color clr1 = Colors.grey,
}) {
  return Expanded(
      child: SizedBox(
    height: ht,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          surfaceTintColor: clr1,
          backgroundColor: (switchColors) ? Colors.white : clr,
        ),
        onPressed: () async {
          await fun();
        },
        child: Text(
          buttonName,
          style: TextStyle(
              color: (switchColors) ? clr : const Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        )),
  ));
}
