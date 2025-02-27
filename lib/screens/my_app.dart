import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ximapp/main.dart';
import 'package:ximapp/res/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ko'), // Default to Korean
      supportedLocales: [
        Locale('en', ''), // English
        Locale('ko', ''), // Korean
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (locale != null &&
              supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return Locale('ko'); // If no match, fallback to Korean
      },
      // home: HomeScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
