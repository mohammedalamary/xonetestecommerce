import 'package:x_one_test/core/constants/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../../core/constants/app_color.dart';

class CustomText extends StatelessWidget {
   String ? text;
  final TextAlign? txtAlign;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final String? fotFamily;
  final int? isAlign;
  final int? textMaxLines;
  // final int? isColorText;

   CustomText(
      {Key? key,
      required this.text,
      this.txtAlign,
      this.fontSize ,
      this.fontWeight = FontWeight.bold,
      this.fotFamily = "Cairo",  this.textColor, this.isAlign=0, this.textMaxLines})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!??"",
      maxLines: textMaxLines,
      // textAlign:txtAlign??( isAlign==1?TextAlign.start:TextAlign.center),
      textAlign: txtAlign ?? TextAlign.start,
      style: CustomStyle(
        sizeFont: fontSize??12,
        fonWeight: fontWeight??FontWeight.bold,
        // colors:context.theme.backgroundColor==ThemeService.lightTheme.backgroundColor?textColor:null,
        colors: textColor??AppColor.black,
        fotFamily: fotFamily??"",

      ).style1(),
    );
  }
}
