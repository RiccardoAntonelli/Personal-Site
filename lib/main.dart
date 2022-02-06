import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_site/screens/home_page/home_page.dart';
import 'package:personal_site/theme.dart';

import 'configuration/configure_nonweb.dart'
    if (dart.library.html) 'configuration/configure_web.dart';
import 'screens/about_me_page/about_me_page.dart';

void main() {
  configureApp();
  runApp(MyApp(theme: SiteTheme.light()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.theme}) : super(key: key);
  SiteTheme theme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        HomePage.route: (context) => HomePage(
            theme: theme, changeTheme: (SiteTheme theme) => this.theme = theme),
        AboutMePage.route: (context) => AboutMePage(
            theme: theme, changeTheme: (SiteTheme theme) => this.theme = theme),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: AppLocalizations.of(context) == null
          ? 'Riccardo A'
          : AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
    );
  }
}
