import 'package:x_one_test/core/constants/app_color.dart';
import 'package:x_one_test/core/constants/custom_style.dart';
import 'package:x_one_test/core/constants/global_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../../ui/wdgit/custom_text.dart';


class MyTextField extends StatelessWidget {
  final TextEditingController? textController;
  final String? label;
  final String? hint;
  final AutovalidateMode? autovalidateMode;

  final String? titleOutText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? showPrefixIcon;
  final bool? showSuffixIcon;
  final bool? enabled;
  void Function()? onEditingComplete;
  void Function()? onTapSuffixIcon;
  List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? textObscure;
  final FocusNode? focusNode;

  String? Function(String?)? validate;
 final void Function(String)? onChange;

  MyTextField(
      {super.key,
      this.textController,
      this.label = '',
      this.hint = '',
      this.validate,
      this.prefixIcon,
      this.showPrefixIcon = false,
      this.enabled = true,
      this.showSuffixIcon = false,
      this.onEditingComplete,
      this.suffixIcon,
      this.titleOutText = '',
      this.onTapSuffixIcon,
      this.inputFormatters,
      this.keyboardType, this.onChange,
        this.textObscure=false, this.focusNode, this.autovalidateMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: titleOutText.toString(),
              txtAlign: TextAlign.start,
              fontSize:GlobalData.labelSize.sp,
              textColor: AppColor.primaryColor),
          TextFormField(
            textInputAction:TextInputAction.next,

            // focusNode: ,
            autovalidateMode:autovalidateMode,
            style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.bold,fontFamily:  "Cairo",) ,
            obscureText:textObscure!,textAlign:TextAlign.center ,
            autofocus: true,
            controller: textController,
            decoration: InputDecoration(
              fillColor:AppColor.primaryColor,

              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical:5),
              border: const OutlineInputBorder(
                  // borderSide: BorderSide(color: Colors.grey,)
                  ),
              // alignLabelWithHint: true,
              enabledBorder:  OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 0)),
              errorStyle:
                  CustomStyle(colors: AppColor.red, sizeFont: 9.sp).style1(),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColor.red, width: 1)),
              enabled: enabled!,
              hintText: hint.toString().tr,
              hintStyle: CustomStyle().style1(),
              labelStyle:TextStyle(fontSize: 8.sp,fontFamily:  "Cairo",)  ,
              // label: Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
              //   child: CustomText(text: label!.tr),
              // ),
              prefixIcon: showPrefixIcon == true
                  ? Icon(
                      prefixIcon,
                      color: AppColor.primaryColor,
                      size: 22,
                    )
                  : null,
              suffixIcon: showSuffixIcon == true
                  ? InkWell(
                      onTap: onTapSuffixIcon,
                      child: Icon(
                        suffixIcon,
                        // color:ThemeService.lightTheme.cardColor==context.theme.cardColor? AppColor.primaryColor:AppColor.forginColor.withOpacity(.9),
                        size: 24,
                      ))
                  : null,
            ),
            focusNode:focusNode,
            validator: validate,

            onChanged:onChange,
            onEditingComplete:onEditingComplete,
            inputFormatters: inputFormatters,
            keyboardType:keyboardType?? TextInputType.text,
          ),
        ],
      ),
    );
  }
}
// class TextFieldPhoneNumber extends StatelessWidget {
//   final TextEditingController? textController;
//   final String label;
//   final AutovalidateMode? autovalidateMode;
//   final String? titleOutText;
//   final bool enabled,inLogin;
//   final int ?maxLinth;
//   void Function()? onEditingComplete;
//   final Widget? suffixIcon;
//   final IconData? prefixIcon;
//  final void Function(String)? onChange;
//
//   TextFieldPhoneNumber(
//       {super.key,
//       this.textController,
//       this.label = Translate.phoneNumber,
//       this.enabled = true,
//       this.onEditingComplete,
//       this.titleOutText = '',
//         this.onChange,
//         this.autovalidateMode= AutovalidateMode.disabled, this.inLogin=false, this.suffixIcon, this.prefixIcon, this.maxLinth});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomText(
//               text: label.tr,
//               txtAlign: TextAlign.start,
//               fontSize: GlobalData.labelSize.sp,
//               fotFamily: "Cairo",
//               textColor: AppColor.primaryColor),
//           TextFormField(
//             textInputAction:TextInputAction.next,
//             // focusNode: ,
//             autovalidateMode:autovalidateMode,
//             style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w100,fontFamily:  "Cairo",) ,
//             textAlign:TextAlign.center ,
//             autofocus: true,
//             controller: textController,
//             decoration: InputDecoration(
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               // floatingLabelAlignment: FloatingLabelAlignment.center,
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 0, vertical:5),
//               border: const OutlineInputBorder(),
//               enabledBorder:  OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(inLogin?10:2)),
//                   borderSide: BorderSide(color: Colors.grey.shade500, width: 0)),
//               errorStyle: CustomStyle(colors: AppColor.red.withOpacity(.7), sizeFont: 9.sp).style1(),
//               focusedBorder:  OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(inLogin?10:2)),
//                   borderSide: BorderSide(color: Colors.grey.shade500, width: 1)),
//               focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(inLogin?10:2),
//                   borderSide:  BorderSide(color: AppColor.red.withOpacity(.7), width: 1)),
//               errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(inLogin?10:2),
//                   borderSide:  BorderSide(color: AppColor.red.withOpacity(.7), width: .5)),
//
//               enabled: enabled,
//               hintText: label.tr,
//               hintStyle:AppTextStyleTheme.hintTxtNor ,
//               // hintStyle:TextStyle(fontSize: 10.sp,fontFamily:  "Cairo",color: ThemeService.lightTheme.cardColor==context.theme.cardColor? Colors.grey.shade400:null) ,
//
//               labelStyle:TextStyle(fontSize: 8.sp,fontFamily:  "Cairo",)  ,
//               suffixIcon: suffixIcon,
//               prefixIcon:
//               Container(margin: const EdgeInsets.symmetric(horizontal: 1.5,vertical: 1.5),decoration: BoxDecoration(color: Get.theme.backgroundColor.withOpacity(1),borderRadius: BorderRadius.only(topRight:Radius.circular(inLogin?10:4),bottomRight: Radius.circular(inLogin?10:4)) ),
//                 child: Icon(prefixIcon??
//                         Icons.phone_android,
//                   color: ThemeService.lightTheme.cardColor==context.theme.cardColor? AppColor.primaryColor:AppColor.forginColor.withOpacity(.9),
//                         size: 22,),
//               ),
//             ),
//             validator:(p0){
//               return  TextValidate().validateMobileNumber(p0.toString(),linth: maxLinth??9);
//             } ,
//             onChanged:onChange,
//             onEditingComplete:onEditingComplete,
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(RegExp("[0-9,٠-٩]")),
//              LengthLimitingTextInputFormatter(maxLinth??(int.tryParse(GlobalData.memAccLen)??9)),
//             ],
//             keyboardType:TextInputType.number,
//           ),
//         ],
//       ),
//     );
//   }
// }
// class TextFieldAmount extends StatelessWidget {
//
//   final TextEditingController? textController;
//   final String label;
//   final AutovalidateMode? autovalidateMode;
//   final String? titleOutText;
//   final bool enabled;
//   void Function()? onEditingComplete;
//   final Widget? suffixIcon;
//  final void Function(String)? onChange;
//
//   TextFieldAmount(
//       {super.key,
//       this.textController,
//       this.label = Translate.amountTransfer,
//       this.enabled = true,
//       this.onEditingComplete,
//       this.titleOutText = '',
//         this.onChange,
//         this.autovalidateMode=AutovalidateMode.onUserInteraction, this.suffixIcon});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomText(
//               text: label.tr,
//               txtAlign: TextAlign.start,
//               fontSize: GlobalData.labelSize.sp,
//               textColor: AppColor.primaryColor),
//           TextFormField(
//             textInputAction:TextInputAction.next,
//
//             // focusNode: ,
//             autovalidateMode:autovalidateMode,
//             style: TextStyle(fontSize: 10.sp,fontFamily:  "Cairo",) ,
//             textAlign:TextAlign.center ,
//             autofocus: true,
//             controller: textController,
//             decoration: InputDecoration(
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               // floatingLabelAlignment: FloatingLabelAlignment.center,
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 32, vertical:6),
//               border: const OutlineInputBorder(
//                   // borderSide: BorderSide(color: Colors.grey,)
//                   ),
//               // alignLabelWithHint: true,
//               enabledBorder:  OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(Radius.circular(2)),
//                   borderSide: BorderSide(color: Colors.grey.shade500, width: 0)),
//               errorStyle:
//                   CustomStyle(colors: AppColor.red.withOpacity(.7), sizeFont: 9.sp).style1(),
//               focusedBorder:  OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(Radius.circular(2)),
//                   borderSide: BorderSide(color: Colors.grey.shade500, width: 1)),
//               focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(2),
//                   borderSide:  BorderSide(color: AppColor.red.withOpacity(.7), width: 1)),
//               enabled: enabled,
//               hintText: label.tr,
//               hintStyle:AppTextStyleTheme.hintTxtNor ,
//               labelStyle:TextStyle(fontSize: 8.sp,fontFamily:  "Cairo",)  ,
//               // label: Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
//               //   child: CustomText(text: label!.tr),
//               // ),
//               // prefixText: "                        ",
//               suffixIcon: suffixIcon,
//               prefixIcon:Container(margin: const EdgeInsets.symmetric(horizontal: 1.5,vertical: 1.5),decoration: BoxDecoration(color: Get.theme.backgroundColor.withOpacity(1),borderRadius:const BorderRadius.only(topRight:Radius.circular(4),bottomRight: Radius.circular(4)) ),
//
//                 child: Icon(
//                         Icons.money,
//                         color: ThemeService.lightTheme.cardColor==context.theme.cardColor? AppColor.primaryColor:AppColor.forginColor.withOpacity(.9),
//                         size: 22,),
//               ),
//             ),
//             validator:(val) => TextValidate().validateTextAll(validate:val.toString(),typeError: "amount"),
//             onChanged:onChange,
//             onEditingComplete:onEditingComplete,
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(RegExp("[0-9,٠-٩,.]")),
//               LengthLimitingTextInputFormatter(int.tryParse(GlobalData.amntLength)??6),
//             ],
//             keyboardType:TextInputType.number,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class TextFieldNote extends StatelessWidget {
//   final TextEditingController? textController;
//   final TextAlign? textAlign;
//   final bool ?isRequired;
//
//   const TextFieldNote(
//       {super.key,
//       this.textController, this.textAlign,this.isRequired=false,
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() =>Container(
//         color: Colors.transparent,
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomText(
//                 text: Translate.propus.tr,
//                 txtAlign: TextAlign.start,
//                 fontSize: GlobalData.labelSize.sp,
//                 textColor: AppColor.primaryColor),
//             TextFormField(
//               textInputAction:TextInputAction.next,
//
//               // focusNode: ,
//               style: TextStyle(fontSize: 9.sp,fontFamily:  "Cairo",) ,
//               textAlign:textAlign??TextAlign.start ,
//               autofocus: true,
//               controller: textController,
//               decoration: InputDecoration(
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 // floatingLabelAlignment: FloatingLabelAlignment.center,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 32, vertical:6),
//                 border: const OutlineInputBorder(
//                     // borderSide: BorderSide(color: Colors.grey,)
//                     ),
//                 // alignLabelWithHint: true,
//                 enabledBorder:  OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(2)),
//                     borderSide: BorderSide(color: Colors.grey.shade500, width: 0)),
//                 errorStyle:
//                     CustomStyle(colors: AppColor.red.withOpacity(.7), sizeFont: 9.sp).style1(),
//                 focusedBorder:  OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(2)),
//                     borderSide: BorderSide(color: Colors.grey.shade500, width: 1)),
//                 focusedErrorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(2),
//                     borderSide:  BorderSide(color: AppColor.red.withOpacity(.7), width: 1)),
//                 enabled: GlobalData.hasInternet.value,
//
//
//                 hintText: Translate.propus.tr,
//                 hintStyle:AppTextStyleTheme.hintTxtNor ,
//                 labelStyle:TextStyle(fontSize: 8.sp,fontFamily:  "Cairo",)  ,
//
//                 prefixText: "   ",
//                 prefixIcon:Container(margin: const EdgeInsets.symmetric(horizontal: 1.5,vertical: 1.5),decoration: BoxDecoration(color: Get.theme.backgroundColor.withOpacity(1),borderRadius:const BorderRadius.only(topRight:Radius.circular(4),bottomRight: Radius.circular(4)) ),
//
//                   child: Icon(
//                           Icons.note_alt_outlined,
//                           color: ThemeService.lightTheme.cardColor==context.theme.cardColor? AppColor.primaryColor:AppColor.forginColor.withOpacity(.9),
//                           size: 22,),
//                 ),
//               ),
//               validator:(x) {
//                 if(isRequired! && x!.trim().isEmpty) {
//                   return 'هذا الحقل اجباري';
//                 }
//                 return null;
//               },
//               keyboardType:TextInputType.text,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class MyTextFieldLogin extends StatelessWidget {
//   final TextEditingController? textController;
//   final String? label;
//   final String? hint;
//   final AutovalidateMode? autovalidateMode;
//
//   final String? titleOutText;
//   final IconData? prefixIcon;
//   final IconData? suffixIcon;
//   final bool? showPrefixIcon;
//   final bool? showSuffixIcon;
//   final bool? enabled;
//   void Function()? onEditingComplete;
//   void Function()? onTapSuffixIcon;
//   List<TextInputFormatter>? inputFormatters;
//   final TextInputType? keyboardType;
//   final bool? textObscure;
//
//   final FocusNode? focusNode;
//
//   String? Function(String?)? validate;
//  final void Function(String)? onChange;
//
//   MyTextFieldLogin(
//       {super.key,
//       this.textController,
//       this.label = '',
//       this.hint = '',
//       this.validate,
//       this.prefixIcon,
//       this.showPrefixIcon = false,
//       this.enabled = true,
//       this.showSuffixIcon = false,
//       this.onEditingComplete,
//       this.suffixIcon,
//       this.titleOutText = '',
//       this.onTapSuffixIcon,
//       this.inputFormatters,
//       this.keyboardType, this.onChange,
//         this.textObscure=false, this.focusNode, this.autovalidateMode});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //color: Colors.grey.shade50,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomText(
//               text: titleOutText.toString(),
//               txtAlign: TextAlign.start,
//               fontSize: GlobalData.labelSize.sp,
//             textColor: AppColor.primaryColor,
//              ),
//           TextFormField(
//             textInputAction:TextInputAction.next,
//             // focusNode: ,
//             autovalidateMode:autovalidateMode,
//             style: TextStyle(fontSize: 10.sp,fontFamily:  "Cairo",) ,
//             obscureText:textObscure!,textAlign:TextAlign.center ,
//             autofocus: true,
//             controller: textController,
//             decoration: InputDecoration(
//               fillColor:context.theme.cardColor.withOpacity(.7) ,
//               filled: true,
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               // floatingLabelAlignment: FloatingLabelAlignment.center,
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 0, vertical:5),
//               border: const OutlineInputBorder(),
//               enabledBorder:  OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: Colors.grey.shade500, width: 0)),
//               errorStyle: CustomStyle(colors: AppColor.red.withOpacity(.7), sizeFont: 9.sp).style1(),
//               focusedBorder:  OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: Colors.grey.shade500, width: 1)),
//               focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide:  BorderSide(color: AppColor.red.withOpacity(.7), width: 1)),
//               errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide:  BorderSide(color: AppColor.red.withOpacity(.7), width: .5)),
//               enabled: enabled!,
//               hintText: hint.toString().tr,
//               hintStyle:AppTextStyleTheme.hintTxtNor ,
//               // hintStyle:TextStyle(fontSize: 10.sp,fontFamily:  "Cairo",) ,
//               labelStyle:TextStyle(fontSize: 8.sp,fontFamily:  "Cairo",)  ,
//               // label: Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
//               //   child: CustomText(text: label!.tr),
//               // ),
//               prefixIcon: showPrefixIcon == true
//                   ? Container(margin: const EdgeInsets.symmetric(horizontal: 1.5,vertical: 1.5),decoration: BoxDecoration(color: Get.theme.backgroundColor.withOpacity(1),borderRadius:const BorderRadius.only(topRight:Radius.circular(4),bottomRight: Radius.circular(4)) ),
//                 child: Icon(
//                         prefixIcon,
//                   color: ThemeService.lightTheme.cardColor==context.theme.cardColor? AppColor.primaryColor:AppColor.forginColor.withOpacity(.9),
//                         size: 22,
//                       ),
//                   )
//                   : null,
//               suffixIcon: showSuffixIcon == true
//                   ? InkWell(
//                       onTap: onTapSuffixIcon,
//                       child: Icon(
//                         suffixIcon,
//                         color: AppColor.primaryColor,
//                         size: 24,
//                       ))
//                   : null,
//             ),
//             focusNode:focusNode,
//             validator: validate,
//
//             onChanged:onChange,
//             onEditingComplete:onEditingComplete,
//             inputFormatters: inputFormatters,
//             keyboardType:keyboardType?? TextInputType.text,
//           ),
//         ],
//       ),
//     );
//   }
// }

class TextFieldName extends StatelessWidget {
  final TextEditingController? textController;
  final String? label;

  const TextFieldName(
      {super.key,
        this.textController,
        this.label,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: label,
              txtAlign: TextAlign.start,
              fontSize: GlobalData.labelSize.sp,
              textColor: AppColor.primaryColor),
          TextFormField(
            textInputAction:TextInputAction.next,
            // focusNode: ,
            style: TextStyle(fontSize: 10.sp,fontFamily:  "Cairo",) ,
            textAlign:TextAlign.center ,
            autofocus: true,
            controller: textController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // floatingLabelAlignment: FloatingLabelAlignment.center,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 32, vertical:6),
              border: const OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.grey,)
              ),
              // alignLabelWithHint: true,
              enabledBorder:  OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 0)),
              errorStyle:
              CustomStyle(colors: AppColor.red.withOpacity(.7),).style1(),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide:  BorderSide(color: AppColor.red.withOpacity(.7), width: 1)),
              hintText: label,

              hintStyle:CustomStyle(colors: AppColor.red, ).style1(),
              labelStyle:TextStyle(fontSize: 8.sp,fontFamily:  "Cairo",)  ,

              prefixText: "   ",
              prefixIcon:Container(margin: const EdgeInsets.symmetric(horizontal: 1.5,vertical: 1.5),decoration: BoxDecoration(color: Get.theme.backgroundColor.withOpacity(1),borderRadius:const BorderRadius.only(topRight:Radius.circular(4),bottomRight: Radius.circular(4)) ),

                child: Icon(
                  Icons.note_alt_outlined,
                  // color: ThemeService.lightTheme.cardColor==context.theme.cardColor? AppColor.primaryColor:AppColor.forginColor.withOpacity(.9),
                  size: 22,),
              ),

            ),
            // validator:(val) {
            //   return TextValidate().validateTextAll(validate:val.toString(),typeError: "name");
            // },
            inputFormatters:  <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Zء-ي \u0900-\u097F]')),
              // FilteringTextIn putFormatter.allow(RegExp("[ ء-ي \u0900-\u097F]"))
            ],
            keyboardType:TextInputType.text,
          ),
        ],
      ),
    );
  }
}

// class TextFieldPhone extends StatelessWidget {
//   final TextEditingController? textController;
//   final String label;
//   final AutovalidateMode? autovalidateMode;
//   final String? titleOutText;
//   final bool enabled,inLogin;
//   void Function()? onEditingComplete;
//   final Widget? suffixIcon;
//   final void Function(String)? onChange;
//
//   TextFieldPhone(
//       {super.key,
//         this.textController,
//         this.label = Translate.phoneNumber,
//         this.enabled = true,
//         this.onEditingComplete,
//         this.titleOutText = '',
//         this.onChange,
//         this.autovalidateMode, this.inLogin=false, this.suffixIcon});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomText(
//               text: label.tr,
//               txtAlign: TextAlign.start,
//               fontSize: 9.sp,
//               textColor: AppColor.primaryColor),
//           TextFormField(
//             textInputAction:TextInputAction.next,
//
//             // focusNode: ,
//             autovalidateMode:autovalidateMode,
//             style: TextStyle(fontSize: 10.sp,fontFamily:"Cairo",fontWeight: FontWeight.normal) ,
//             textAlign:TextAlign.center ,
//             autofocus: true,
//             controller: textController,
//             decoration: InputDecoration(
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               // floatingLabelAlignment: FloatingLabelAlignment.center,
//               contentPadding:
//               const EdgeInsets.symmetric(horizontal: 0, vertical:5),
//               border: const OutlineInputBorder(
//                 // borderSide: BorderSide(color: Colors.grey,)
//               ),
//               // alignLabelWithHint: true,
//               enabledBorder:  OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(inLogin?10:2)),
//                   borderSide: BorderSide(color: Colors.grey.shade500, width: 0)),
//               errorStyle:
//               CustomStyle(colors: AppColor.red.withOpacity(.7), sizeFont: 9.sp).style1(),
//               focusedBorder:  OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(inLogin?10:2)),
//                   borderSide: BorderSide(color: Colors.grey.shade500, width: 1)),
//               focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(inLogin?10:2),
//                   borderSide:  BorderSide(color: AppColor.red.withOpacity(.7), width: 1)),
//               enabled: enabled,
//
//               hintText: label.tr,
//               hintStyle:TextStyle(fontSize: 10.sp,fontFamily:  "Cairo-Regular",color: ThemeService.lightTheme.cardColor==context.theme.cardColor? Colors.grey.shade400:null) ,
//               labelStyle:TextStyle(fontSize: 6.sp,fontFamily:  "Cairo-Regular",)  ,
//               // label: Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
//               //   child: CustomText(text: label!.tr),
//               // ),
//               suffixIcon: suffixIcon,
//               prefixIcon:
//               Container(margin: const EdgeInsets.symmetric(horizontal: 1.5,vertical: 1.5),decoration: BoxDecoration(color: Get.theme.backgroundColor.withOpacity(1),borderRadius:const BorderRadius.only(topRight:Radius.circular(4),bottomRight: Radius.circular(4)) ),
//                 child: Icon(
//                   Icons.phone_android,
//                   color: ThemeService.lightTheme.cardColor==context.theme.cardColor? AppColor.primaryColor:AppColor.forginColor.withOpacity(.9),
//                   size: 22,),
//               ),
//             ),
//             validator:(p0) => TextValidate().validateMobileNumber(p0.toString()),
//             onChanged:onChange,
//             onEditingComplete:onEditingComplete,
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(RegExp("[0-9,٠-٩]")),
//               LengthLimitingTextInputFormatter(9),
//             ],
//             keyboardType:TextInputType.number,
//           ),
//         ],
//       ),
//     );
//   }
// }

