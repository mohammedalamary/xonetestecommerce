import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_one_test/core/constants/app_color.dart';

class IconAppBar extends StatelessWidget {
  const IconAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 40,
        padding: const EdgeInsets.only(right: 8),
        margin: const EdgeInsets.only(top: 32, right: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.white,
            border: Border.all(color: AppColor.grey)),
        child: const Icon(Icons.arrow_back_ios, color: AppColor.grey),
      ),
    );
  }
}
