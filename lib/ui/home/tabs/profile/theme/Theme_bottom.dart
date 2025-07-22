import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../provider/app_language_provider.dart';
import '../../../../../provider/app_theme_provider.dart';

//import 'app_localizations.dart';

class ThemeBottom extends StatefulWidget{
  @override
  State<ThemeBottom> createState() => _LanguageBottomState();
}

class _LanguageBottomState extends State<ThemeBottom> {
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    var  themeProvider = Provider.of<AppThemeProvider>(context);


    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:width*0.04 ,
      vertical:height*0.02 ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [

          InkWell(
            onTap:(){
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.isDark()?
                getSelectedThemeItem(languageText: AppLocalizations.of(context)!.dark):
                getUnSelectedThemeItem(languageText: AppLocalizations.of(context)!.dark),
          ),
          SizedBox(height: height*0.02,),

          InkWell(
            onTap: (){
              // todo: change lang. to arabic
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.isLight()?
            getSelectedThemeItem(languageText: AppLocalizations.of(context)!.light):
            getUnSelectedThemeItem(languageText: AppLocalizations.of(context)!.light),

          )
        ],
      ),
    );
  }

  Widget getSelectedThemeItem ( {required String languageText}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(languageText,
          style: AppFonts.bold20Primary,),
       const Icon(Icons.check , color: AppColors.primaryLightColor,size: 30, )
      ],
    );
  }
  Widget getUnSelectedThemeItem ( {required String languageText}){
    return
      Text(languageText,
        style: AppFonts.bold20dark,);
  }
}