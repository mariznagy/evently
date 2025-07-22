import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../home/tabs/home_tab/widget/custom_elevated_button.dart';
import '../../home/tabs/home_tab/widget/custom_text.dart';

class LoginScreen extends StatefulWidget {
  static const String loginRouteName= 'login';

   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: 'mariz@gmail.com') ;

  TextEditingController passwordController = TextEditingController(text: '123456') ;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.04
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height*0.04,),
              Image.asset(AppAssets.logo_auth,
              height: height*0.20,
              width: width*0.20,),
              SizedBox(height: height*0.02,),
              Form(
                  key: formKey,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFiled(
                    controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    validator: (text){
                      if(text== null || text.isEmpty){
                        return 'Please enter an email';
                      }
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid){
                        return 'Please enter vaild email';
                      }
                      return null;
                    },
                    hintText:AppLocalizations.of(context)!.email,
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: height*0.02,),

                  CustomTextFiled(
                    controller: passwordController,
                    hintText:AppLocalizations.of(context)!.password,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (text){
                      if(text== null || text.isEmpty){
                        return 'Please enter password';
                      }
                      if(text.length<6){
                        return 'Please enter at least 6 numbers';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height*0.02,),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(onPressed: (){
                      //todo: navigate to pass screen
                    },
                      child: Text("${AppLocalizations.of(context)!.forget_password}?",
                        textAlign: TextAlign.end,
                        style: AppFonts.bold16primary.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryLightColor
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  CustomElevatedButton(onPressed: (){
                    login();
                  }, text: AppLocalizations.of(context)!.login,
                      backgroundColor: AppColors.primaryLightColor,
                      borderSideColor: AppColors.primaryLightColor),
                  SizedBox(height: height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${AppLocalizations.of(context)!.do_not_have_account}?" ,
                          style: AppFonts.med16black),
                      SizedBox(width: width*0.02,),
                      TextButton(onPressed: (){
                        //todo: to signup
                        Navigator.of(context).pushNamed(AppRoutes.registerRouteName);
                      },
                        child: Text("${AppLocalizations.of(context)!.create_account}",
                          style: AppFonts.bold16primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLightColor
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 2,
                          color: AppColors.primaryLightColor,
                          indent: width*0.5,
                          endIndent:width*0.5 ,
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.or,
                        style: AppFonts.med16primary,),
                      Expanded(
                        child: Divider(
                          color: AppColors.primaryLightColor,
                          thickness: 2,
                          indent: width*0.5,
                          endIndent:width*0.5 ,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  CustomElevatedButton(onPressed: (){

                  }, text: AppLocalizations.of(context)!.login_with_google,
                      backgroundColor: AppColors.transparent,
                      hasIcon: true,
                      iconName: Image.asset(AppAssets.googleIcon),
                      mainAxisAlignment: MainAxisAlignment.center,
                      textStyle: AppFonts.med20primary,
                      borderSideColor: AppColors.primaryLightColor)
                ],
              ))



            ],
          ),
        ),
      )),
    );
  }

  void login() {
    if(formKey.currentState?.validate()==true){
      Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);

    }
  }
}


