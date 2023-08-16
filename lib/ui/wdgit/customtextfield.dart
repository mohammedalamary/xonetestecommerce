import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x_one_test/core/constants/app_color.dart';
import 'package:x_one_test/core/constants/custom_style.dart';
import 'package:x_one_test/ui/wdgit/custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.textController, this.text, this.validate, this.inputFormatters, this.inputType});
  final TextEditingController? textController;
  final String? text;
 final String? Function(String?)? validate;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text:text??"",
          ),
          TextFormField(
            textInputAction:TextInputAction.next,
            controller:textController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // floatingLabelAlignment: FloatingLabelAlignment.center,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 32, vertical:6),
              filled: true,
              fillColor: AppColor.white,
              border:  OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.grey,)
                borderRadius: BorderRadius.circular(22.0),
              ),
              hintText:text,
              hintStyle:const TextStyle(fontSize: 10,color: AppColor.grey) ,
              enabledBorder:  OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 0)),
              errorStyle: CustomStyle(colors: AppColor.red.withOpacity(.7), ).style1(),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:  BorderSide(color: AppColor.red.withOpacity(.7), width: 1)),

            ),
            validator: validate,
              inputFormatters: inputFormatters,
              keyboardType:inputType??TextInputType.text
          ),
        ],
      ),
    );
  }
}
