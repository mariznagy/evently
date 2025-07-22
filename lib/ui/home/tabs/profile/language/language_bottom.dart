import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../provider/app_language_provider.dart';

//import 'app_localizations.dart';

class LanguageBottom extends StatefulWidget{
  @override
  State<LanguageBottom> createState() => _LanguageBottomState();
}

class _LanguageBottomState extends State<LanguageBottom> {
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    var LanguageProvider = Provider.of<AppLanguageProvider>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:width*0.04 ,
      vertical:height*0.02 ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [

          InkWell(
            onTap:(){
              LanguageProvider.changeLanguage('en');
            },
            child: LanguageProvider.appLanguage=='en'?
                getSelectedLanguageItem(languageText: AppLocalizations.of(context)!.english):
                getUnSelectedLanguageItem(languageText: AppLocalizations.of(context)!.english),
          ),
          SizedBox(height: height*0.02,),

          InkWell(
            onTap: (){
              // todo: change lang. to arabic
              LanguageProvider.changeLanguage('ar');
            },
            child: LanguageProvider.appLanguage=='ar'?
            getSelectedLanguageItem(languageText: AppLocalizations.of(context)!.arabic):
            getUnSelectedLanguageItem(languageText: AppLocalizations.of(context)!.arabic),

          )
        ],
      ),
    );
  }

  Widget getSelectedLanguageItem ( {required String languageText}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(languageText,
          style: AppFonts.bold20Primary,),
       const Icon(Icons.check , color: AppColors.primaryLightColor,size: 30, )
      ],
    );
  }
  Widget getUnSelectedLanguageItem ( {required String languageText}){
    return
      Text(languageText,
        style: AppFonts.bold20dark,);
  }
}