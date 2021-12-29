import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prayer_times_project/screens/onboarding_welcome/onboarding_welcome_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'), //english
      Locale('tr', 'TR'), //türkçe
      Locale('de', 'DE'), //deutcsh
      Locale('el', 'GR'), //greek
      Locale('fr', 'FR'), //french
      Locale('it', 'IT'), //italian
      Locale('id', 'ID'), //indonesian
      Locale('ms', 'MY'), //malay
      Locale('hi', 'IN'), //hindi
      Locale('es', 'ES'), //spanish
      Locale('pt', 'PT'), //portuguese
    ],
    path: 'assets/translations',
    fallbackLocale: Locale('en', 'US'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'prayerTimesProject',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnboardingWelcomeWidget(),
    );
  }
}
