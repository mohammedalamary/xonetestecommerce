import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:x_one_test/core/constants/app_color.dart';
import 'package:x_one_test/ui/wdgit/custom_text.dart';

class CustomGetImageBottomSheet {
  getImage(Function(String imageSelect) imageFun) {
    Get.bottomSheet(Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Get.theme.cardColor,
      ),
      child: Wrap(
        children: [
          ListTile(
            title: CustomText(
                text: "الكيمراء",
            ),
            leading: Icon(Icons.camera, color: AppColor.primaryColor),
            onTap: () async{
              Get.back();
          await getImageFun(imageSource: ImageSource.camera).then((value) {
                imageFun(value);
              });
            },
          ),
          ListTile(
            title: CustomText(
                text: "الاستوديو",),
            leading: Icon(
              Icons.image,
              color: AppColor.primaryColor,
            ),
            onTap: () {
              Get.back();
              getImageFun(imageSource: ImageSource.gallery)
                  .then((value) {
                imageFun(value);
              });
            },
          ),
        ],
      ),
    ));
  }
  static Future<String> getImageFun({required ImageSource imageSource}) async {
    String selectImagePath = '';
    try {
      final pickImage = await ImagePicker().pickImage(source: imageSource);
      if (pickImage != null) {
        selectImagePath = pickImage.path.toString();
      } else {
      }
    } catch (e) {
    }
    if (selectImagePath.isEmpty) {
    }

    return selectImagePath;
  }

}