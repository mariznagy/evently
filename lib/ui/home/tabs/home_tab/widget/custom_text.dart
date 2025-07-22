import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_styles.dart';
typedef OnValidator = String? Function(String?)?;

class CustomTextFiled extends StatelessWidget {
  Color colorBorderSide;
  Color cursorColor;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController controller;
  OnValidator? validator;
  TextInputType? keyboardType;
  bool obscureText;
  String? obscuringCharacter;
  int? maxLines;

   CustomTextFiled({super.key ,
     this.cursorColor=AppColors.greyColor ,
     this.colorBorderSide= AppColors.greyColor,
   this.hintText,
   this.hintStyle, this.labelStyle, this.labelText
   , this.prefixIcon , this.suffixIcon,
   required this.controller,
     this.validator,
     this.keyboardType = TextInputType.text,
     this.obscureText = false,
     this.obscuringCharacter ,
     this.maxLines
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines:maxLines??1 ,
      decoration: InputDecoration(
        enabledBorder:builtDecorationBorder(colorBorderSide :colorBorderSide),
        focusedBorder: builtDecorationBorder(colorBorderSide:colorBorderSide ),
        errorBorder: builtDecorationBorder(colorBorderSide:AppColors.redColor ),
        focusedErrorBorder: builtDecorationBorder(colorBorderSide:AppColors.redColor ),
        hintText: hintText,
        hintStyle:hintStyle ?? AppFonts.med16grey,
        labelText: labelText,
        labelStyle: labelStyle ?? AppFonts.med16grey,
        prefixIcon:prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle: AppFonts.med16grey.copyWith(
          color: AppColors.redColor
        ),

      ),
      controller:controller ,
      cursorColor:cursorColor ,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter ?? '*',
    );
  }
  OutlineInputBorder builtDecorationBorder({required colorBorderSide }){
    return  OutlineInputBorder (

        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: colorBorderSide,
            width: 1
        ),

    );
  }
}
