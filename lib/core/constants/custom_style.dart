import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// class CustomStyle {
//   final double? sizeFont;
//   final Color? colors;
//   final FontWeight? fonWeight;
//   final String? fotFamily;
//
//   CustomStyle({
//     this.sizeFont,
//     this.colors,
//     this.fonWeight,
//     this.fotFamily = ""});
//   // title default
//
//   TextStyle style1() {
//     return TextStyle(
//         fontSize: sizeFont ?? 12,
//         // color: colors,
//         color: colors??Colors.black,
//         fontWeight: fonWeight??FontWeight.bold,
//         // letterSpacing: 1.3,
//         fontFamily:"Cairo",);
//   }
// }
class CustomStyle {
  final double? sizeFont;
  final Color? colors;
  final FontWeight? fonWeight;
  final String? fotFamily;

  CustomStyle({
    this.sizeFont,
    this.colors,
    this.fonWeight,
    this.fotFamily = ""});
  // title default
  TextStyle titleStyle() {
    return   const TextStyle(
        fontSize: 16,
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontFamily: "FontF");
  }
  TextStyle style1() {
    return TextStyle(
      fontSize: sizeFont ?? 12,
      color: colors??Colors.black,
      fontWeight: fonWeight,
      fontFamily: fotFamily??"Cairo",);
  }
}
