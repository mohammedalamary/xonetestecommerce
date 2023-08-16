import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:x_one_test/core/constants/app_color.dart';
import 'package:x_one_test/core/constants/global_data.dart';
import 'package:x_one_test/core/model/spinner.dart';
import 'package:x_one_test/ui/wdgit/custom_text.dart';
class CustomSpinner extends StatelessWidget {
  final List<Spinner>? list;
  final TextEditingController? controller;
  final String? textSpinner;
  final String? textLabel;
  late String? selectId;
  final String? emptyData;
  final RxBool? isLoading;
  final double? height;
  final int? type;
  final bool? enabled;
  final String? Function(String?)? errorValidate;
  final GestureTapCallback? onTapSpinner;
  CustomSpinner(
      {this.list,
      this.controller,
      this.textSpinner,
      this.onTapSpinner,
      this.textLabel,
      this.selectId,
      this.errorValidate,
      this.isLoading,
      this.height,
        this.emptyData, this.type=0, this.enabled=false
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Get.bottomSheet(
            Container(
              decoration:  const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: ListView(
                shrinkWrap:true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text:textSpinner,
                        textColor: AppColor.black,
                      ),
                      IconButton(onPressed: () {
                        Get.back();
                      },
                          icon: const Icon(Icons.close,
                            color: AppColor.primaryColor,
                          )),
                    ],
                  ),
                  Obx(() {
                    if (isLoading!.value ==
                        true) {
                      return const SpinKitFadingCircle(
                        duration: Duration(seconds: 2),
                        color: AppColor.primaryColor,
                        size:60.0,
                      );
                    }else if(list!.isEmpty){
                        return Column(
                          children:  [
                            CustomText(
                              text:"no data",
                              textColor: AppColor.black,
                            ),
                            // NoDataFound(),
                          ],
                        );
                      }else{
                      return   Obx(()=>
                      ListView.builder(
                        itemCount: list!.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          // radio_button_checked_sharp
                          return

                            Column(
                            children: [
                              list![index] == 0
                                  ? Center(
                                  child: CustomText(
                                    text: "حدث خطاء اثناء عملية جلب البانات",
                                    textColor: AppColor.primaryColor,
                                  ))
                                  : const SizedBox(
                                height: 0,
                              ),
                              // type==0?
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  if (selectId == "storeId") {
                                    GlobalData.storeId = list![index].id.toString();
                                    print("storeId = : ${list![index].id}");
                                    print("store  name= : ${list![index].nameAr}");

                                    // GlobalData.reginId = list![index].id.toString();
                                  }
                                  else {
                                    print("storeId = : ${list![index].id}");
                                    print("id = :${list![index].nameAr}");

                                  }
                                  controller!.text = list![index].nameAr!;
                                  GlobalData.id = list![index].id.toString();

                                  Get.back();
                                  print("id data");
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 4),
                                      child: CustomText(
                                        text:list![index].nameAr.toString(),
                                      ),
                                    ),
                                    const Divider(
                                      thickness:1,
                                      color:AppColor.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      )
                      );
                    }

                  }
                  ),

                  const SizedBox(height: 22,),

                ],
              ),
            ),
            isDismissible: false,
          );
      },
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: textLabel.toString(),
              fontSize:12,
              // textColor: AppColor.primaryColor,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                TextFormField(
                  controller: controller,
                  style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold) ,
                  textAlign: TextAlign.start,
                  validator: errorValidate ?? (errorValidate),
                  decoration: InputDecoration(
                    hintStyle:const TextStyle(color: AppColor.grey,fontSize: 10,fontWeight: FontWeight.bold),
                    hintText: "${textLabel!.tr} ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(width: 1.5, color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColor.primaryColor, width: 1.5)),
                    suffixIcon: const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 32),
                  ),
                  enabled: false,
                ),
                Obx(
                  () => isLoading!.value == true
                      ? const Positioned(
                          // top: 12,
                          // width: Get.width / 2,
                          child: SpinKitFadingCircle(
                            color: AppColor.primaryColor,
                            size: 50.0,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
