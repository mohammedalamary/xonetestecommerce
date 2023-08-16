import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColor {
  static const Color forginColor = Color(0xffCB612D);

  static const Color grey = Color(0xff8e8e8e);
  static const Color greyLess = Color(0xffF6F6F6);
  static  Color greyOpc = Colors.grey.shade500;

  static const Color backgroundColor = Color(0xffF9F9F9) ;
  // static const Color backgroundColor = Color(0xffF8F9FD) ;
  // static const Color primaryColor = Color(0xff004481);//0xff001B8D
  static const Color primaryColor = Color(0xff3EB86F);//0xff001B8D

  // static const Color primaryColor = Color(0xff0B2C7D);//0xff001B8D
  // static const Color primaryColor = Color(0xff8e1b1d);
  // static const Color primaryColor = Color(0xff001B8D); //amal
  // static const Color primaryColor = Color(0xFF880E4F);
  // static const Color primaryColor = Color(0xFF880E4F);  0xFFE90D33
  // static const Color primaryColor = Color(0xffF2786D);

  static  Color secondaryColor=  const Color(0xffF6F6F6);// primary color appBar
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color whiteBottomSheet = Color(0xffffffff);
  static const Color red = Colors.red;
  // static const Color red = Color(0xffe50522);
  static const Color colorIcon = Color(0xff8e8e8e);
  ///    rather than hard-coding colors in your build methods.
  static const MaterialColor customColor = MaterialColor(
    0xff0B2C7D,
    {
      50:Color.fromRGBO(218, 4, 24, 1.0),
      100:Color.fromRGBO(218, 4, 24, 1.0),
      200:Color.fromRGBO(218, 4, 24, 1.0),
      300:Color.fromRGBO(218, 4, 24, 1.0),
      400:Color.fromRGBO(150, 10, 23, 1.0),
      500:Color.fromRGBO(204, 6, 23, 0.8666666666666667),
      600:Color.fromRGBO(204, 6, 23, 1.0),
      700:Color.fromRGBO(218, 4, 54, 0.9921568627450981),
      800:Color.fromRGBO(210, 7, 27, 1.0),
      900:Color.fromRGBO(218, 4, 24, 1.0),
    },
  );
}