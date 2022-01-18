import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:personal_site/theme.dart';

class AboutMePage extends StatefulWidget {
  static const String route = '/about_me/';

  const AboutMePage({Key? key, this.theme, this.changeTheme}) : super(key: key);
  final SiteTheme? theme;
  final Function? changeTheme;

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  late SiteTheme _theme;

  @override
  void initState() {
    _theme = widget.theme!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      child: Scaffold(
        backgroundColor: _theme.firstBackgroundColor,
        body: Stack(children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hi! I'm Riccardo and I'm currently an high school student. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: _width / 20,
                        color: _theme.textColor,
                      ),
                    ),
                  ]),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Row(children: [
              Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: _theme.appBarIconColor,
                  ),
                  tooltip: 'Back',
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _theme.appBarButtonColor,
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _theme = changeTheme(_theme);
                    });
                  },
                  icon: _theme == SiteTheme.light()
                      ? Icon(Icons.dark_mode_outlined,
                          color: _theme.appBarIconColor)
                      : Icon(Icons.light_mode_outlined,
                          color: _theme.appBarIconColor),
                  tooltip:
                      _theme == SiteTheme.light() ? 'Dark mode' : 'Light mode',
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _theme.appBarButtonColor,
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  SiteTheme changeTheme(SiteTheme currentTheme) {
    if (currentTheme == SiteTheme.dark()) {
      widget.changeTheme!(SiteTheme.light());
      return SiteTheme.light();
    } else {
      widget.changeTheme!(SiteTheme.dark());
      return SiteTheme.dark();
    }
  }
}
