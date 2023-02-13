import 'package:flutter/material.dart';
import 'package:bai_tap_figma1/ui/widget/utils/colors.dart';

class TextStyles {
  static TextStyle textItem = TextStyle(
      color: Colos.DAtext,
      fontWeight: FontWeight.w300,
      fontSize: 20,
      fontFamily: 'gilroy',
      decoration: TextDecoration.none
  );

  static TextStyle textSize20 = TextStyle(
    color: Colos.LOGINTEXT1,
    fontWeight: FontWeight.w300,
    fontSize: 20,
    fontFamily: 'gilroy',
    decoration: TextDecoration.none
  );
  static TextStyle textSize22 = TextStyle(
      color: Colos.LOGINTEXT1,
      fontWeight: FontWeight.w600,
      fontSize: 22,
      fontFamily: 'gilroy',
      decoration: TextDecoration.none
  );

  static TextStyle textSize14 = TextStyle(
      fontSize: 16,
      color: Colos.LOGINTEXT2,
      fontFamily: 'gilroy',
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static TextStyle textAppBar = const TextStyle(
    fontSize: 18,
    color: Colos.LOGINTEXT1,
    fontFamily: 'gilroy',
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );

  static TextStyle textSize24 = TextStyle(
    fontSize: 28,
    color: Colos.LOGINTEXT1,
    fontFamily: "gilroy",
    fontWeight: FontWeight.bold,
  );

  static TextStyle textSize13 = TextStyle(
    fontSize: 13,
    color: Colos.LOGINTEXT1,
    fontFamily: "gilroy",
    fontWeight: FontWeight.w400,
  );
}