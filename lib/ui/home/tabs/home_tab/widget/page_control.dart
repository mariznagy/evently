import 'package:evently/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../provider/app_language_provider.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_styles.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final langProvider = Provider.of<AppLanguageProvider>(context);
    final isEnglish = langProvider.appLanguage == 'en';

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        //vertical: height * 0.02,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language, // "Language"
            style: AppFonts.bold20Primary,
          ),
           Spacer(),
           SizedBox(width: width*0.05),
          ToggleButtons(
            isSelected: [isEnglish, !isEnglish],
            onPressed: (index) {
              langProvider.changeLanguage(index == 0 ? 'en' : 'ar');
            },
            borderRadius: BorderRadius.circular(60),
            selectedColor: Colors.white,
            fillColor: AppColors.primaryLightColor,
            color: Colors.grey,
            constraints: BoxConstraints(minWidth: width * 0.1, minHeight: height*0.04),
            children: [
              Image.asset(AppAssets.en,
               // width: width*0.02,
                fit: BoxFit.fill,
              ),
              Image.asset(AppAssets.ar,
                //width: width*0.02,
                fit: BoxFit.fill,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
