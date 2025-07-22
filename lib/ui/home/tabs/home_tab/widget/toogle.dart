import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../provider/app_theme_provider.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_styles.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final isLight = themeProvider.isLight();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height*0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.theme, // "Theme"
            style: AppFonts.bold20Primary,
          ),
           //SizedBox(width: width*0.02),
          Spacer(),
          ToggleButtons(
            isSelected: [isLight, !isLight],
            onPressed: (index) {
              themeProvider.changeTheme(
                  index == 0 ? ThemeMode.light : ThemeMode.dark);
            },
            borderRadius: BorderRadius.circular(60),
            selectedColor: Colors.white,
            fillColor: AppColors.primaryLightColor,
            color: Colors.grey,
            constraints: BoxConstraints(minWidth: width * 0.1, minHeight: height*0.04),
            children:  [
              Icon(Icons.wb_sunny_outlined),
              Icon(Icons.nightlight_round),

            ],
          ),
        ],
      ),
    );
  }
}
