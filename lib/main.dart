import 'package:flutter/material.dart';
import 'package:personal_site/screens/home_page/home_page.dart';
import 'screens/about_me_page/about_me_page.dart';
import 'configuration/configure_nonweb.dart'
    if (dart.library.html) 'configuration/configure_web.dart';

import 'package:personal_site/theme.dart';

void main() {
  configureApp();
  runApp(MyApp(theme: SiteTheme.dark()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.theme}) : super(key: key);
  SiteTheme theme;

  //TODO: aggiungi link github codice sito, finisci home page mobile, fai about me page mobile

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
      title: 'Flutter Demo',
      theme: ThemeData(),
    );
  }
}
