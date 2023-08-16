import 'package:flutter/material.dart';
import 'package:x_one_test/core/constants/app_color.dart';
import 'package:x_one_test/core/constants/routes.dart';
import 'package:x_one_test/core/constants/translate.dart';
import 'package:x_one_test/ui/wdgit/custom_text.dart';
import 'package:get/get.dart';
class TitlePage extends StatelessWidget {
  const TitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Spacer(),
            Center(child: CustomText(text: Translate.products)),
            const Spacer(),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.addProduct);
              },
              child: Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                margin: const EdgeInsets.only(top: 8, left: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.white,
                    border: Border.all(color: AppColor.grey)),
                child: const Icon(Icons.add, color: AppColor.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
