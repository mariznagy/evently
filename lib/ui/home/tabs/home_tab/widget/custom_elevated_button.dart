import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  Color? backgroundColor;
  Color? borderSideColor;
  bool hasIcon;
  Widget? iconName;
  TextStyle? textStyle;
  MainAxisAlignment? mainAxisAlignment;
   CustomElevatedButton({super.key, required this.onPressed ,
     required this.text,
   required this.backgroundColor,
     this.borderSideColor,  this.textStyle ,this.iconName,this.hasIcon= false,
   this.mainAxisAlignment= MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric( horizontal: width*0.02, vertical: height*0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              width: 1,
              color: borderSideColor ?? AppColors.primaryLightColor,
            )
          )
        ),
        onPressed: onPressed,
          child: hasIcon?
          Row(
            mainAxisAlignment: mainAxisAlignment!,
            children: [
              iconName!,
              SizedBox(width: width*0.04,),
              Text(text,
                style: textStyle)
            ],
          )

          : Text(text,
        style: AppFonts.med20white,)
    );
  }
}
