

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_item.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_tab_list.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../provider/event_list.dart';

class HomeTab extends StatefulWidget {

   HomeTab({super.key, selectedIndex});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getEventNameList(context);
    if(eventListProvider.eventList.isEmpty){
      eventListProvider.getAllEvents();

    }

    List<String> eventImageList =[
      AppAssets.sport,
      AppAssets.bgEvent,
      AppAssets.meeting,
      AppAssets.gaming,
      AppAssets.workShop,
      AppAssets.book_club,
      AppAssets.exhibition,
      AppAssets.holiday,
      AppAssets.eating,

    ];
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
       // AppColors.primaryLightColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )
        ),
        title: Row(
          children: [
            SizedBox(height: height*0.03,),
            Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                SizedBox(height: height*0.01,),
                Text(AppLocalizations.of(context)!.welcome_back,
                  style: AppFonts.med16white,),
                Text('Route Academy',
                  style: AppFonts.bold24white,),
              ],
            ),
            Spacer(),
            SizedBox(height: height*0.02,),

            ImageIcon(AssetImage(AppAssets.sun), color: AppColors.lightBgColor,),
            Container(
              margin: EdgeInsets.only(left: width*0.02),
              padding: EdgeInsets.symmetric(
                horizontal: width*0.02,
                vertical: height*0.01
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.lightBgColor
              ),
              child: Text('EN', style: AppFonts.bold14Primary,),
            )
          ],
        ),
        bottom: AppBar(
          automaticallyImplyLeading: false,

          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: height*0.11,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )
          ),
          title: Column(
            children: [
              Row(
                children: [
                   ImageIcon(AssetImage(AppAssets.mapIconU),color: AppColors.lightBgColor,),
                  SizedBox(width:width*0.02 ,),
                  Text('Cairo , Egypt', style: AppFonts.med16white,)

                ],
              ),
              SizedBox(height: height*.01,),
              DefaultTabController(
                length:eventListProvider.eventNameList.length,
                child:  TabBar(
                  isScrollable: true,
                      tabAlignment: TabAlignment.start ,
                      labelPadding: EdgeInsets.zero,
                      indicatorColor: AppColors.transparent,
                      dividerColor:AppColors.transparent,
                      tabs: eventListProvider.eventNameList.map((eventName){
                        return EventTabList (
                            selectedTextStyle: Theme.of(context).textTheme.headlineMedium! ,
                            unselectedTextStyle: Theme.of(context).textTheme.headlineSmall!,
                          selectedBgColor: Theme.of(context).focusColor,
                        isSelected : eventListProvider.selectedIndex==
                            eventListProvider.eventNameList.indexOf(eventName),
                        eventName:eventName);
                },).toList(),
                    onTap: (index){
                      eventListProvider.changeSelectedIndex(index);
                  }

                  ),

              )],
          ),
        ),
          ),
      body: Column(
        children: [
          Expanded(child: eventListProvider.filterEventList.isEmpty? Center(child:
            Text('is empty'),):
          ListView.separated(
            padding: EdgeInsets.only(top: height*0.02),
              itemBuilder: (context, index) {
            return EventItem(event:eventListProvider.filterEventList[index],);
          },
              separatorBuilder: (context, index) {
            return SizedBox(
              height: height*0.02,
            );
              },
              itemCount: eventListProvider.filterEventList.length))
        ],
      ),
    );
  }

}
