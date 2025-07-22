import 'package:evently/model/event.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  Event event;
   EventItem({super.key , required this.event});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width*0.04
      ),
        // color: Colors.amber,
      height: height*0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryLightColor,
          width: 2
        ),
        image:   DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(event.eventImage),),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
      horizontal: width*0.02,
        vertical: height*0.01
      ),
        padding: EdgeInsets.symmetric(
            horizontal: width*0.02,
            vertical: height*0.001

        ),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color:AppColors.lightBgColor ,
          ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(event.eventDate.day.toString(),
                  style: AppFonts.bold20Primary,),
                Text( DateFormat('MMM').format(event.eventDate),
                  style: AppFonts.bold14Primary,),
              ],
            )
          ),
          Container(

            alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(
                  horizontal: width*0.02,
                  vertical: height*0.01
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: width*0.02,
                  vertical: height*0.01

              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:AppColors.lightBgColor ,
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(event.title, style: AppFonts.bold14Black,)),
                  InkWell(
                    onTap: (){

                    },
                    child: Image.asset(AppAssets.favIconU,
                        color: AppColors.primaryLightColor ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
