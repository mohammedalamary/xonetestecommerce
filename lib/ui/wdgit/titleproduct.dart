import 'package:flutter/material.dart';
import 'package:x_one_test/core/constants/translate.dart';
import 'package:x_one_test/ui/wdgit/custom_text.dart';

class TitleProduct extends StatelessWidget {
  const TitleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.only(right: 22.0,bottom: 22,top: 16),
      child: CustomText(text:Translate.productPictures,isAlign: 0,txtAlign:TextAlign.start),
    );
  }
}
