import 'dart:io';

import 'package:flutter/services.dart';
import 'package:x_one_test/core/constants/app_color.dart';
import 'package:x_one_test/core/constants/global_data.dart';
import 'package:x_one_test/core/constants/translate.dart';
import 'package:x_one_test/ui/addproduct/addproduct_controller.dart';
import 'package:x_one_test/ui/wdgit/add_img_prodect.dart';
import 'package:x_one_test/ui/wdgit/custom_spinner.dart';
import 'package:x_one_test/ui/wdgit/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_one_test/ui/wdgit/custombutton.dart';
import 'package:x_one_test/ui/wdgit/customtextfield.dart';
import 'package:x_one_test/ui/wdgit/iconappbar.dart';
import 'package:x_one_test/ui/wdgit/titleproduct.dart';
class AddProductView extends StatelessWidget {
   AddProductView({super.key});
final controller = Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: CustomText(text: "اضافة منتجات"),
        centerTitle: true,
        elevation: 0.0,
        leadingWidth: 60,
        toolbarHeight: 80,
        leading:const IconAppBar(),
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Form(
        key: controller.globalKey,
        autovalidateMode:AutovalidateMode.onUserInteraction,
        child: ListView(
          shrinkWrap: true,
          children:  [
            const TitleProduct(),
            // const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  ...List.generate(4, (index) =>  Flexible(
                    child:
                    GetBuilder<AddProductController>(
                      builder: (logic) {
                        return InkWell(onTap: (){
                          print("9999999");
                          logic.selectImg(index);
                        },
                          child:(logic.img0.value.isEmpty&&index==0)||(logic.img1.value.isEmpty&&index==1)||(logic.img2.value.isEmpty&&index==2)||(logic.img3.value.isEmpty&&index==3)?
                          const ProdectAddImg():
                          InkWell(onTap: () {
                            print("object");
                            logic.selectImg(index);
                          },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Image.file(File(index==0?logic.img0.value:index==1?logic.img1.value:index==2?logic.img2.value:index==3?logic.img3.value:logic.img3.value),fit: BoxFit.cover,width: Get.width,height: 80),
                            ),
                          ),
                        );
                      },
                    ),
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 8,),

            //  CustomButton(text:Translate.addPictures,stateIcon:1,onPressed: () {
            //   controller.selectImg();
            // },),
            CustomTextField(textController:controller.productName,text:Translate.productName,validate: controller.validateField),
            CustomTextField(textController:controller.storeName,text:Translate.storeName,validate: controller.validateField),
            CustomTextField(textController:controller.priceController,text: Translate.price,validate: controller.validateField,inputType:TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9,٠-٩]")),
              LengthLimitingTextInputFormatter(9),
            ],),
            CustomSpinner(
              errorValidate: controller.validateField,
              isLoading:false.obs,
              selectId:"storeId",
              textLabel: "التصنيف",
              controller:controller.categoryCont,
              list:controller.spinnerTypeCategories,
              textSpinner:"اسم التصنيف ",
            ),

           const SizedBox(height: 8,),
             CustomButton(text:Translate.addProduct,onPressed: (){
              controller.addProduct(nameProduct: controller.productName.text,
                  store:controller.storeName.text,price:controller.priceController.text,categoriesId:GlobalData.storeId);
            }),
          ],
        ),
      ),
    );
  }
}

