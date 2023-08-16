import 'package:flutter/material.dart';
import 'package:x_one_test/core/constants/app_color.dart';
import 'package:x_one_test/ui/wdgit/custom_text.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: AppColor.backgroundColor,
      title: CustomText(text: "اضافة,,,,,, منتجات"),
      centerTitle: true,
      elevation: 0.0,
      leadingWidth: 60,
      toolbarHeight: 80,
      leading: Container(
        width: 100,
        height: 40,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 32,right: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.white,
            border: Border.all(color: AppColor.grey)
        ),
        child: const Icon(Icons.arrow_back_ios,color: AppColor.grey),
      ),
    );
  }
}
