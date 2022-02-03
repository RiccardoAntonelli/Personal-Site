import 'package:flutter/material.dart';

import 'package:personal_site/screens/home_page/home_page_desktop.dart';
import 'package:personal_site/screens/home_page/home_page_mobile.dart';
import 'package:personal_site/widgets/adaptive_builder.dart';
import 'package:personal_site/theme.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  const HomePage({Key? key, this.theme, this.changeTheme}) : super(key: key);
  final SiteTheme? theme;
  final Function? changeTheme;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      desktopLayout: HomePageDesktop(
        theme: widget.theme,
        changeTheme: widget.changeTheme,
      ),
      mobileLayout: HomePageMobile(
        theme: widget.theme,
        changeTheme: widget.changeTheme,
      ),
    );
  }
}
