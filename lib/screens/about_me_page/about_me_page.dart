import 'package:flutter/material.dart';
import 'package:personal_site/screens/about_me_page/about_me_page_desktop.dart';
import 'package:personal_site/screens/about_me_page/about_me_page_mobile.dart';
import 'package:personal_site/theme.dart';
import 'package:personal_site/widgets/adaptive_builder.dart';

class AboutMePage extends StatefulWidget {
  static const String route = '/about_me/';

  const AboutMePage({Key? key, this.theme, this.changeTheme}) : super(key: key);
  final SiteTheme? theme;
  final Function? changeTheme;

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      desktopLayout: AboutMePageDesktop(
        theme: widget.theme,
        changeTheme: widget.changeTheme,
      ),
      mobileLayout: AboutMePageMobile(
        theme: widget.theme,
        changeTheme: widget.changeTheme,
      ),
    );
  }
}
