
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

YYDialog showDioalogCustom(BuildContext context, String title, String subTitle) {
  return YYDialog().build(context)
    ..width = 300
    ..borderRadius = 4.0
    ..text(
      padding: EdgeInsets.only(left: 16, right: 16, top: 32),
      alignment: Alignment.center,
      text: title,
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    )
    ..text(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 32),
      alignment: Alignment.center,
      text: subTitle,
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    )
    ..divider()

    ..doubleButton(
      padding: EdgeInsets.only(top: 10.0),
      gravity: Gravity.center,
      withDivider: true,
      text1: "확인",
      color1: Colors.redAccent,
      fontSize1: 14.0,
      fontWeight1: FontWeight.bold,
      onTap1: () {

      },
      text2: "취소",
      color2: Colors.redAccent,
      fontSize2: 14.0,
      fontWeight2: FontWeight.bold,
      onTap2: () {
      },
    )
    ..show();
}