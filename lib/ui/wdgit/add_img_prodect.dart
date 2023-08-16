import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_one_test/core/constants/app_color.dart';

class ProdectAddImg extends StatelessWidget {
  const ProdectAddImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 80,
        width: Get.width/5,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
        ),child:const Icon(Icons.add) ,
      ),
    );
  }
}
