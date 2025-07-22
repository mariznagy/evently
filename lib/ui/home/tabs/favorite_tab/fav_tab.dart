import 'package:evently/ui/home/tabs/home_tab/widget/custom_text.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../utils/app_color.dart';
import '../home_tab/widget/event_item.dart';

class FavoriteTab extends StatelessWidget {
  TextEditingController searchController = TextEditingController() ;
   FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return SafeArea(child:
    Column(
      children: [
        SizedBox(height: height*0.03,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.04),
          child: CustomTextFiled(
            controller:searchController ,
              colorBorderSide: AppColors.primaryLightColor,
            cursorColor: AppColors.primaryLightColor,
            hintText:AppLocalizations.of(context)!.search,
            hintStyle: AppFonts.med16primary,
            prefixIcon: Icon(Icons.search, color:AppColors.primaryLightColor ,),
          ),
        ),
        Expanded(child: ListView.separated(
            padding: EdgeInsets.only(top: height*0.02),
            itemBuilder: (context, index) {
              return Container();
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: height*0.02,
              );
            },
            itemCount: 20))
      ],
    ));
  }
}
