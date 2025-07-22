import 'package:evently/ui/home/tabs/home_tab/widget/custom_elevated_button.dart';
import 'package:evently/ui/home/tabs/profile/theme/Theme_bottom.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../provider/app_language_provider.dart';
import '../../../../provider/app_theme_provider.dart';
import '../../../../utils/app_routes.dart';
import 'language/language_bottom.dart';

class ProfileTab extends StatefulWidget{
  
  static const String routeName= 'ProfileTab';
  const ProfileTab ({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    var LanguageProvider = Provider.of<AppLanguageProvider>(context);
    var  themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: height*0.18,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50)
          )
        ),
        backgroundColor: AppColors.primaryLightColor,
        title: Padding(
          padding:  EdgeInsets.only(
            bottom: height*0.00
          ),
          child: Row(
            children: [
              Image.asset( AppAssets.AppBarImage),
              SizedBox(width: width*0.04,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John Safwat',style: AppFonts.bold24white,),
                  Text('johnsafwat@gmail.com',style: AppFonts.med16white,),
                ],
              )
            ],
          ),
        ),
      ) ,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width *0.04,
        vertical: height*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headlineLarge,),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: height*0.01
              ),
              padding: EdgeInsets.symmetric(
                  vertical: height*0.01,
                horizontal: width*0.02
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color:AppColors.primaryLightColor,
                  width: 2
                )
              ),
              child: InkWell(
                onTap: (){
                  showLanguageBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(LanguageProvider.appLanguage=='en'?
                    AppLocalizations.of(context)!.english:
                    AppLocalizations.of(context)!.arabic,
                      style: AppFonts.bold20Primary,),
                    Icon(Icons.arrow_drop_down, size: 30,color: AppColors.primaryLightColor,)
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineLarge,),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: height*0.01
              ),
              padding: EdgeInsets.symmetric(
                  vertical: height*0.01,
                  horizontal: width*0.02
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color:AppColors.primaryLightColor,
                      width: 2
                  )
              ),
              child: InkWell(
                onTap: (){
                  showThemeBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(themeProvider.isDark()?
                    AppLocalizations.of(context)!.dark:
                    AppLocalizations.of(context)!.light,
                      style: AppFonts.bold20Primary,),
                    Icon(Icons.arrow_drop_down, size: 30,color: AppColors.primaryLightColor,)
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.registerRouteName);

            },
                text: AppLocalizations.of(context)!.logout,
                textStyle: AppFonts.reg20white,
                backgroundColor: AppColors.redColor,
              hasIcon: true,
              iconName: Padding(
                padding:  EdgeInsets.only(left: width*0.02),
                child: Icon(Icons.login_outlined , size: 25, color: AppColors.lightBgColor,),
              ),
              borderSideColor: AppColors.redColor,

                ),

            SizedBox(height: height*0.02,)
          ],
        ),
      ),

    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context) => LanguageBottom()
    );
  }
  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context) => ThemeBottom()
    );
  }
}


/*ElevatedButton(
              style: ElevatedButton.styleFrom(

                backgroundColor: AppColors.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
                onPressed: (){
              //todo: logout
            },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*0.01,
                    vertical: height*0.02),
                  child: Row(
                                children: [
                  Icon(Icons.logout , size: 30, color: AppColors.lightBgColor,),
                  SizedBox(width: width*0.02,),
                  Text(AppLocalizations.of(context)!.logout,
                  style: AppFonts.reg20white,)
                                ],
                              ),
                )
            ),*/