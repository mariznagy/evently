import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';

class DateOrTime extends StatelessWidget {
  String iconDateOrTime;
  String eventDateOrTime;
  String chooseDateOrTime;
  VoidCallback onChooseDateOrTimeClick;

  DateOrTime({super.key,
    required this.chooseDateOrTime,
    required this.iconDateOrTime ,
    required this.eventDateOrTime,
  required this.onChooseDateOrTimeClick});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Row(
      children: [
        Image.asset(iconDateOrTime ,  color: Theme.of(context)!.dividerColor,) ,
        SizedBox(width: width*0.02,),
        Text(eventDateOrTime,style: Theme.of(context).textTheme.titleLarge,),
        Spacer(),
        TextButton(onPressed: (){
          onChooseDateOrTimeClick();

        }, child: Text( chooseDateOrTime,style: AppFonts.med16primary,))
      ],
    );
  }
}
