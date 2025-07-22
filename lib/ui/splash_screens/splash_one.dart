import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_styles.dart';
import '../home/tabs/home_tab/widget/page_control.dart';
import '../home/tabs/home_tab/widget/toogle.dart';
import 'Onboarding_2.dart';

class OnboardingScreen1 extends StatelessWidget {
  static const String onboarding1RouteName= 'splash_one';
   OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Material(
      elevation: 0,
      child: Container(
        color: AppColors.lightBgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.06),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height*0.08,),
                Image.asset(AppAssets.logo , height: height*0.06),
                SizedBox(height: height*0.01,),
                Image.asset(AppAssets.onScreen),
                SizedBox(height: height*0.01,),
                Text('Personalize Your Experience',
                  style: AppFonts.bold20Primary,),
                Text('Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                  style: AppFonts.med14Black,),
                SizedBox(height: height*0.01,),
                LanguageToggle(),
                SizedBox(height: height*0.001,),
                ThemeToggle(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_forward), // أو Icons.arrow_back
                      onPressed: () {
                        goToNextScreen(context);
                      },
                    )
                   ,
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
        builder: (context) =>  OnboardingTwoScreen(),
      ),
    );
  }

}
