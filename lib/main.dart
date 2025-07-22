import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/provider/event_list.dart';
import 'package:evently/ui/authentication/login/login.dart';
import 'package:evently/ui/authentication/register/register_screen.dart';
import 'package:evently/ui/home/home_screen.dart';
import 'package:evently/ui/home/tabs/add_event/add_event.dart';
import 'package:evently/ui/splash_screens/Onboarding_2.dart';
import 'package:evently/ui/splash_screens/onbording.dart';
import 'package:evently/ui/splash_screens/splash_one.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
    ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
    ChangeNotifierProvider(create: (context) => EventListProvider(),),

  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var LanguageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute:AppRoutes.homeRouteName ,
        routes: {
          AppRoutes.homeRouteName: (context)=> HomeScreen(),
          AppRoutes.registerRouteName: (context)=> RegisterScreen(),
          AppRoutes.loginRouteName: (context)=> LoginScreen(),
          AppRoutes.onboarding1RouteName: (context)=> OnboardingScreen1(),
          AppRoutes.onboarding2RouteName: (context)=> OnboardingTwoScreen(),
          AppRoutes.addEventRouteName: (context)=> AddEvent(),

        },
      locale: Locale(LanguageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:themeProvider.appTheme,
    );
  }
}


