import 'package:flutter/material.dart';
import 'package:remedium_alert/l10n/app_localizations.dart' show AppLocalizations;
import 'package:remedium_alert/view/page/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remedium Alert',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt'),
      supportedLocales: [Locale('pt'), Locale('en')],
      home: const HomePage(title: 'Remedium Alert'),
    );
  }
}
