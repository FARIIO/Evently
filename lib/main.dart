import 'package:evently/cache/cache_helper.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/screens/forget_password_screen.dart';
import 'package:evently/screens/home_screen.dart';
import 'package:evently/screens/intro_screen.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/screens/onboarding_screen.dart';
import 'package:evently/screens/signup_screen.dart';
import 'package:evently/tabs/profile/profile_tab.dart';
import 'package:evently/utils/evently_routes.dart';
import 'package:evently/utils/evently_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await CacheHelper.cacheInit();
  runApp(
      MultiProvider(
        providers: [
         ChangeNotifierProvider(create: (context) => LanguageProvider(),),
         ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ],
          child: Evently()
      )
  );
}

class Evently extends StatelessWidget{
  Evently({super.key});
  @override
  Widget build(BuildContext context) {
  var languageProvider = Provider.of<LanguageProvider>(context);
  var themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      theme: EventlyTheme.lightTheme,
      darkTheme: EventlyTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      initialRoute: EventlyRoutes.homeScreen,
      routes: {
        EventlyRoutes.introScreen : (context) => IntroScreen(),
        EventlyRoutes.onboardingScreen : (context) => OnBoardingScreen(),
        EventlyRoutes.homeScreen : (context) => HomeScreen(),
        EventlyRoutes.loginScreen : (context) => LoginScreen(),
        EventlyRoutes.signupScreen : (context) => SignupScreen(),
        EventlyRoutes.forgetPassword : (context) => ForgetPasswordScreen(),
      },
    );
  }

}