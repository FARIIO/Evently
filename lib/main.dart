import 'package:evently/cache/cache_helper.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/screens/add_event_screen.dart';
import 'package:evently/screens/forget_password_screen.dart';
import 'package:evently/screens/home_screen.dart';
import 'package:evently/screens/intro_screen.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/screens/onboarding_screen.dart';
import 'package:evently/screens/signup_screen.dart';
import 'package:evently/utils/evently_routes.dart';
import 'package:evently/utils/evently_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  bool isOnboardingSeen = pref.getBool("onBoardingSeen") ?? false;
   await CacheHelper.cacheInit();
  runApp(
      MultiProvider(
        providers: [
         ChangeNotifierProvider(create: (context) => LanguageProvider(),),
         ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ],
          child: Evently(isOnboardingSeen: isOnboardingSeen,)
      )
  );
}

class Evently extends StatelessWidget{
  Evently({super.key, required this.isOnboardingSeen});
    final bool isOnboardingSeen;
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
      initialRoute:
      isOnboardingSeen ?
          EventlyRoutes.loginScreen
          : EventlyRoutes.introScreen,
      routes: {
        EventlyRoutes.introScreen : (context) => IntroScreen(),
        EventlyRoutes.onboardingScreen : (context) => OnBoardingScreen(),
        EventlyRoutes.homeScreen : (context) => HomeScreen(),
        EventlyRoutes.loginScreen : (context) => LoginScreen(),
        EventlyRoutes.signupScreen : (context) => SignupScreen(),
        EventlyRoutes.forgetPassword : (context) => ForgetPasswordScreen(),
        EventlyRoutes.addEventScreen : (context) => AddEventScreen(),
      },
    );
  }

}