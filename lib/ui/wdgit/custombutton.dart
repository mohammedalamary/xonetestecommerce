import 'package:x_one_test/core/constants/app_color.dart';
import 'package:x_one_test/ui/wdgit/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomButton extends StatelessWidget {
  final String? text;
  final int? stateIcon;
 final void Function()? onPressed;
  const CustomButton({super.key, this.text, this.stateIcon=0, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        // height: 100,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.primaryColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        // اضغط لاضافة  الصورة
            stateIcon==1? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.white
                ),
                child: const Icon(Icons.add,color: AppColor.primaryColor,)):const SizedBox(),
            const SizedBox(width: 10,),

            CustomText(text:text,textColor: AppColor.white),

          ],
        ),
      ),
    );
  }
}
