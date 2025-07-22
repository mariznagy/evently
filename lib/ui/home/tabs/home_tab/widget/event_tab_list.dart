import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventTabList extends StatelessWidget {
  bool isSelected;
  String eventName;
  Color selectedBgColor;
  TextStyle selectedTextStyle;
  TextStyle unselectedTextStyle;
  Color? borderColor;

  EventTabList({super.key,required this.eventName,
    required this.selectedTextStyle, required this.unselectedTextStyle,
    required this.selectedBgColor ,required this.isSelected,
  this.borderColor});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width*0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width*0.02,
        vertical: height*0.002
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          color: borderColor ?? Theme.of(context).focusColor,
          width: 2
        ),
          color: isSelected? selectedBgColor : AppColors.transparent,
      ),
      child: Text(eventName,
      style: isSelected ? selectedTextStyle : unselectedTextStyle
     ),
    );
  }
}
/* Row(
        children: [
          ImageIcon(AssetImage(Icons.all_out_outlined as String))
        ],
      ),*/

/*Theme.of(context).textTheme.headlineMedium :
      Theme.of(context).textTheme.headlineSmall*/