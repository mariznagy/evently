import 'package:evently/ui/home/tabs/favorite_tab/fav_tab.dart';
import 'package:evently/ui/home/tabs/home_tab/home_tab.dart';
import 'package:evently/ui/home/tabs/map_tab/map_tab.dart';
import 'package:evently/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
//import 'app_localizations.dart';

class HomeScreen extends StatefulWidget{

  static const String routeName= 'home_screen';
   HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List <Widget> tabs =[
    HomeTab(), MapTab(),FavoriteTab(), ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar:Theme(
        data: Theme.of(context).copyWith(
          canvasColor:Theme.of(context).primaryColor
        ),
        child: BottomNavigationBar(
          currentIndex:selectedIndex ,
            onTap: (index){
            selectedIndex= index;
            setState(() {

            });
            },
            items: [
          builtBottomNavigationBar(label: AppLocalizations.of(context)!.home, selectedIconName: AppAssets.homeIconS
              ,unselectedIconName: AppAssets.homeIconU , index: 0),
          builtBottomNavigationBar(index:1 , label: AppLocalizations.of(context)!.map,
            selectedIconName: AppAssets.mapIconS, unselectedIconName:AppAssets.mapIconU, ),
          builtBottomNavigationBar(index:2 ,label: AppLocalizations.of(context)!.fav,  selectedIconName: AppAssets.favIconS, unselectedIconName:AppAssets.favIconU),
          builtBottomNavigationBar(index:3,label: AppLocalizations.of(context)!.profile, selectedIconName: AppAssets.profileIconS, unselectedIconName:AppAssets.profileIconU),
        ]),
      ) ,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);

      },
      child: Icon(Icons.add, color: AppColors.lightBgColor,size: 35,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    body: tabs[selectedIndex],
    );
  }








  BottomNavigationBarItem builtBottomNavigationBar( { required String label,required int index , required String selectedIconName, required String unselectedIconName}){
    return BottomNavigationBarItem
      (icon: ImageIcon(AssetImage(selectedIndex== index? selectedIconName: unselectedIconName)),
        label:label );
  }
}
/*Container(
        padding: EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 20
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: AppColors.grayColor),
        child: ImageIcon(AssetImage(imageName))):*/