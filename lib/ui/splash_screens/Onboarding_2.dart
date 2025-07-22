import 'package:evently/l10n/app_localizations_ar.dart';
import 'package:evently/ui/authentication/login/login.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../provider/app_language_provider.dart';
import '../../../../provider/app_theme_provider.dart';

import '../home/tabs/home_tab/widget/page_control.dart';
import '../home/tabs/home_tab/widget/toogle.dart';

class OnboardingTwoScreen extends StatelessWidget {
  static const String onboarding2RouteName= 'onboarding_2';
   OnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return
     Material(
       elevation: 0,
       child: Container(
        color: AppColors.lightBgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.06),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height*0.03,),
                Image.asset(AppAssets.logo , height: height*0.06),
                SizedBox(height: height*0.01,),
                Image.asset(AppAssets.onBoarding2),
                SizedBox(height: height*0.01,),
                Text('Find Events That Inspire You',
                style: AppFonts.bold20Primary,),
                Text('Dive into a world of events crafted to fit your unique interests. Whether you re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
                  style: AppFonts.med14Black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_forward), // أو Icons.arrow_back
                      onPressed: () {
                        goToNextScreen(context);
                      },
                    )
                  ],
                ),

                   ],
            ),
          ),
        ),
           ),
     );
  }
  void goToNextScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  LoginScreen(),
      ),
    );
  }
}


/*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin:  EdgeInsets.symmetric(horizontal: 4),
                    width: onboarding2routeName == index ? 12 : 8,
                    height: onboarding2routeName == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: onboarding2routeName == index ? Color(0xFF5064FF) : Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              )*/