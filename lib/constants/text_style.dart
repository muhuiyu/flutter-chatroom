import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'all_constants.dart';

class TextStyleConstant {
  // H1
  static const TextStyle h1 = TextStyle(
      color: ColorConstant.white, fontSize: 60, fontWeight: FontWeight.bold);
  // H2
  static const TextStyle greenH2 = TextStyle(
      color: ColorConstant.brandGreen,
      fontSize: 24,
      fontWeight: FontWeight.bold);
  static const TextStyle whiteH2 = TextStyle(
      color: ColorConstant.white, fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle greyH2 = TextStyle(
      color: ColorConstant.grey, fontSize: 24, fontWeight: FontWeight.bold);

  // H3
  static const TextStyle h3 = TextStyle(
      color: ColorConstant.white, fontSize: 20, fontWeight: FontWeight.bold);

  // Body
  static const TextStyle greenBody =
      TextStyle(color: ColorConstant.brandGreen, fontSize: 16);
  static const TextStyle whiteBody =
      TextStyle(color: ColorConstant.white, fontSize: 16);
  static const TextStyle greyBody =
      TextStyle(color: ColorConstant.grey, fontSize: 16);
  static const TextStyle secondaryLabelBody =
      TextStyle(color: ColorConstant.secondaryLabel, fontSize: 16);
  static const TextStyle errorBody =
      TextStyle(color: ColorConstant.error, fontSize: 16);

  // OTP
  static const TextStyle otpCode =
      TextStyle(color: ColorConstant.label, fontSize: 30, letterSpacing: 30);
}
