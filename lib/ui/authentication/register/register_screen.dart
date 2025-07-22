import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/app_routes.dart';
import '../../home/tabs/home_tab/widget/custom_elevated_button.dart';
import '../../home/tabs/home_tab/widget/custom_text.dart';

class RegisterScreen extends StatefulWidget {
  static const String registerRouteName= 'register_screen';

   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController() ;

  TextEditingController nameController = TextEditingController() ;

  TextEditingController passwordController = TextEditingController() ;

  TextEditingController rePasswordController = TextEditingController() ;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBgColor,
        iconTheme: IconThemeData(
          color: AppColors.blackColor
        ),
        title:Text(AppLocalizations.of(context)!.register,
        style: AppFonts.bold16black,) ,
        centerTitle: true,
      ),
      body: SafeArea(child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.04
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height*0.01,),
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
                    controller: nameController,
                    validator: (text){
                      if(text== null || text.isEmpty){
                        return 'Please enter an name';
                      }
                      return null;
                    },
                    hintText:AppLocalizations.of(context)!.name,
                    prefixIcon: Icon(Icons.person),
                  ),
                  SizedBox(height: height*0.02,),
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
                  CustomTextFiled(
                    controller: rePasswordController,
                    hintText:AppLocalizations.of(context)!.re_password,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (text){
                      if(text== null || text.isEmpty){
                        return 'Please enter re-password';
                      }
                      if(text.length<6){
                        return 'Please enter at least 6 numbers';
                      }if (passwordController.text != rePasswordController.text){
                        return 're-password dosent match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height*0.02,),
                  CustomElevatedButton(onPressed: (){
                    register();
                  }, text: AppLocalizations.of(context)!.create_account,
                      backgroundColor: AppColors.primaryLightColor,
                      borderSideColor: AppColors.primaryLightColor),
                  SizedBox(height: height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${AppLocalizations.of(context)!.already_have_account}?" , style: AppFonts.med16black),
                      SizedBox(width: width*0.01,),
                      TextButton(onPressed: (){
                        //todo: to signup
                        Navigator.pop(context);
                      },
                        child: Text("${AppLocalizations.of(context)!.login}",
                          style: AppFonts.bold16primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLightColor
                          ),),
                      ),
                    ],
                  ),

                    ],
                  ),
              )



            ],
          ),
        ),
      )),
    );
  }

  void register() {
    if(formKey.currentState?.validate()==true){
      Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);

    }
  }
}


