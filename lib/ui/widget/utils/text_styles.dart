import 'package:flutter/material.dart';
import 'package:bai_tap_figma1/ui/widget/utils/colors.dart';

class TextStyles {

  static TextStyle textSize20 = TextStyle(
    color: Colos.LOGINTEXT1,
    fontWeight: FontWeight.w200,
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
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static TextStyle textSize24 = TextStyle(
    fontSize: 28,
    color: Colos.LOGINTEXT1,
    fontFamily: "gilroy",
    fontWeight: FontWeight.w700,
  );
  static TextStyle textSize13 = TextStyle(
    fontSize: 13,
    color: Colos.LOGINTEXT1,
    fontFamily: "gilroy",
    fontWeight: FontWeight.w400,
  );
}