import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/evently_images.dart';
import 'package:evently/utils/evently_routes.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:evently/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/dimensions.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var width = context.width;
    var height = context.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height*0.01
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(EventlyImages.evently),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height*0.02
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.loginTitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.mail_outline_rounded),
                    hintText: AppLocalizations.of(context)!.enterEmail,
                  ),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    hintText: AppLocalizations.of(context)!.enterPassword,
                    isSuffixIcon: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                        text: AppLocalizations.of(context)!.forgetPassword,
                      textStyle:
                      themeProvider.isDark
                          ? Theme.of(context).textTheme.labelSmall!.copyWith(
                        decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).primaryColor,)
                          : Theme.of(context).textTheme.displaySmall!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: onForgetPasswordClicked,
                    ),
                  ),
                  CustomElevatedButton(
                    buttonColor: Theme.of(context).primaryColor,
                      title: AppLocalizations.of(context)!.login,
                      onButtonClick: onButtonClick,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAccount,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomTextButton(
                        text: AppLocalizations.of(context)!.signUp,
                        textStyle: themeProvider.isDark
                            ? Theme.of(context).textTheme.labelSmall!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).primaryColor,
                        )
                            : Theme.of(context).textTheme.displaySmall!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: onSignUpClicked,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.02
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            height: height * 0.01,
                            color: Theme.of(context).dividerColor,
                            endIndent: width * 0.04,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.or,
                          style:  themeProvider.isDark
                              ? Theme.of(context).textTheme.displayMedium
                              : Theme.of(context).textTheme.labelMedium,
                        ),
                        Expanded(
                          child: Divider(
                            height: height * 0.01,
                            thickness: 1,
                            color: Theme.of(context).dividerColor,
                            indent: width * 0.04,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    isLogo: true,
                      title: AppLocalizations.of(context)!.loginWithGoogle,
                      onButtonClick: (){
                        //todo:Login With Google
                      },
                    textStyle: themeProvider.isDark
                        ? Theme.of(context).textTheme.displayMedium
                        : Theme.of(context).textTheme.labelMedium,
                    buttonColor: Theme.of(context).cardColor,
                    isBorder: true,
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  void onButtonClick() {
    Navigator.pushReplacementNamed(context, EventlyRoutes.homeScreen);
  }

  void onSignUpClicked() {
    Navigator.pushNamed(context, EventlyRoutes.signupScreen);
  }

  void onForgetPasswordClicked() {
    Navigator.pushNamed(context, EventlyRoutes.forgetPassword);
  }
}