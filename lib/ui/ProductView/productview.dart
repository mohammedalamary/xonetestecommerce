import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_one_test/core/constants/app_color.dart';
import 'package:x_one_test/core/constants/imageassets.dart';
import 'package:x_one_test/ui/ProductView/productview_controller.dart';
import 'package:x_one_test/ui/wdgit/add_img_prodect.dart';
import 'package:x_one_test/ui/wdgit/custom_text.dart';
import 'package:x_one_test/ui/wdgit/viewProduct/titlepage.dart';

class ProductViewScreen extends StatelessWidget {
   ProductViewScreen({super.key});
final controller = Get.put(ProductViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(onRefresh: () async{
        controller.getProduct();
      },
        child: ListView(
          shrinkWrap:true,
          children:  [
            const SizedBox(height: 16,),
            const TitlePage(),
            const SizedBox(height: 16,),

            Obx(()=> SizedBox(
                  height: 100,
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.storeImage.length
                  ,itemBuilder: (BuildContext context, int index) {
                  return  GestureDetector(onTap: () {
                    print(controller.storeImage[index]["name"]);
                    controller.catId.value=controller.storeImage[index]["id"];
                    controller.getProduct();
                  },
                    child: Obx(()=>
                      Container(
                        height: 80,width: 80,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        // width: Get.width,
                        decoration:BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color:controller.catId.value==index?AppColor.primaryColor:Colors.grey,width:controller.catId.value==index? 1:0)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(child: Image.asset(controller.storeImage[index]["image"],width: 60,height: 70,)),
                            CustomText(text: controller.storeImage[index]["name"]),
                          ],
                        ),
                      ),
                    ),
                  );
                },),
              ),
            ),
            const SizedBox(height: 32,),
            Obx(()=>controller.productList.value.isNotEmpty?
            ListView.builder(shrinkWrap: true,itemCount: controller.productList.value.length,controller:
            ScrollController(keepScrollOffset: false),itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(onTap: () {
                      if(controller.details.value==index){
                        controller.showDetails.toggle();
                        controller.details.value=index;
                      }else{
                        controller.showDetails.value=true;
                        controller.details.value=index;
                      }
                    },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),color: Colors.white,padding: EdgeInsets.symmetric(vertical: 4) ,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  // height: 84,
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                    child:(controller.productList.value[index].img.toString()!="null")? Image.file(File(controller.productList.value[index].img.toString()),fit: BoxFit.cover,height: 80,width: 80,) :
                                    Image.asset( controller.productList.value[index].img??
                                        AppImageAsset.product,fit: BoxFit.cover,height: 80,width: 80,)
                                ),
                                const SizedBox(width: 6,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text:  controller.productList.value[index].productName.toString(),),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          CustomText(text: controller.productList.value[index].price.toString(),textColor: AppColor.primaryColor,fontSize:12),
                                          const SizedBox(width: 2,),
                                          CustomText(text: "دولار",fontSize: 10),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                                          decoration: BoxDecoration(
                                            color: AppColor.greyLess,
                                            borderRadius: BorderRadius.circular(6)
                                          ),
                                          child: CustomText(text:controller.productList.value[index].store.toString(),fontSize: 10,)),
                                    ],
                                  ),
                                ),
                                GestureDetector(onTap: () {
                                  controller.deleteProduct(controller.productList.value[index].productName.toString());
                                },child: const Icon(Icons.delete,color: Colors.red)),
                                SizedBox(width: 8,)
                              ],
                            ),
                            Obx(()=>controller.showDetails.value&&controller.details.value==index&&((controller.productList.value[index].countImg??0).obs>1)? Column(
                                children: [
                                  const Divider(color: AppColor.primaryColor),
                                  CustomText(text: "التفاصيل"),
                                  const SizedBox(height: 4,),
                                  Row(children: [
                                    ((controller.productList.value[index].img2??"").isNotEmpty)? showImg(img:controller.productList.value[index].img2.toString()):SizedBox(),
                                    ((controller.productList.value[index].img3??"").isNotEmpty)? showImg(img:controller.productList.value[index].img3.toString()):SizedBox(),
                                    ((controller.productList.value[index].img4??"").isNotEmpty)? showImg(img:controller.productList.value[index].img4.toString()):SizedBox()

                                  ],)
                                ],
                              ):controller.showDetails.value&&controller.details.value==index?CustomText(text: "المنتج لا يحتوي على المزيد من الصور"):SizedBox(),
                            ),
                         ],
                        ),
                      ),
                    ),
                  ),
              ):Center(child: CustomText(text:  "التصنيف رقم :" "${controller.catId.value}  " "لا يوجد فيه منتجات" ,fontSize: 20,txtAlign: TextAlign.center,)),
            )
          ],
        ),
      ),
    );
  }
}

class showImg extends StatelessWidget {
  const showImg({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Image.file(File(img),fit: BoxFit.cover,width: Get.width/4,height: 80),
    );
  }
}
