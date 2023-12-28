/*
this is the first pages of the apps
you can use logic to direct the pages to bottom_navigation_bar.dart or signin.dart
this demo is direct to login.dart
We use CupertinoPageTransitionsBuilder in this demo
If you want to use default transition, then remove ThemeData Widget below and delete theme attribute
If you want to show debug label, then change debugShowCheckedModeBanner to true

To use multiple language, wrap BlocBuilder with InitialWrapper
Initial wrapper is to get the language from shared preferences when first time you open the apps
in MaterialApp attribute : add supportedLocales, localizationsDelegates and locale

To use multi language in other page, this is the step :
open assets/lang/en.json and other language and add new 'word' language in the json field
add import 'package:campusbook/ui/reuseable/app_localizations.dart'; in the page
and then use AppLocalizations.of(context)!.translate('word')!
for simple example, you could see lib/ui/default.dart => AppLocalizations.of(context)!.translate('default')!
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:campusbook/config/constants.dart';
import 'package:campusbook/cubit/language/language_cubit.dart';
import 'package:campusbook/ui/reuseable/app_localizations.dart';
import 'package:campusbook/ui/reuseable/initial_wrapper.dart';
import 'package:campusbook/ui/splash_screen.dart';

void main() {
  // this function makes application always run in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // initialize bloc here
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (BuildContext context) => LanguageCubit(),
        ),
      ],
      // if you want to change default language, go to lib/ui/reuseable/initial_wrapper.dart and change en US to your default language
      child: InitialWrapper(
        child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
          print(state.toString());
          return MaterialApp(
            theme: ThemeData(
              pageTransitionsTheme: PageTransitionsTheme(builders: {
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              }),
            ),
            supportedLocales: [
              Locale('en', 'US'),
              Locale('fr', 'FR'),
            ],
            // These delegates make sure that the localization data for the proper language is loaded
            localizationsDelegates: [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            // Returns a locale which will be used by the app
            locale: (state is ChangeLanguageSuccess)
                ? state.locale
                : Locale('en', 'US'),
            title: APP_NAME,
            debugShowCheckedModeBanner: false,
            home: SplashScreenPage(),
          );
        }),
      ),
    );
  }
}
