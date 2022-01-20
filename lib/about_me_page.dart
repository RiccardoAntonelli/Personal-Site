import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:google_fonts/google_fonts.dart';

import 'package:personal_site/theme.dart';
import 'package:personal_site/widgets/footer.dart';
import 'package:personal_site/widgets/grid_item.dart';
import 'package:personal_site/widgets/painters/rrect_drawing.dart';
import 'package:personal_site/widgets/painters/underline_drawing.dart';

class AboutMePage extends StatefulWidget {
  static const String route = '/about_me/';

  const AboutMePage({Key? key, this.theme, this.changeTheme}) : super(key: key);
  final SiteTheme? theme;
  final Function? changeTheme;

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage>
    with TickerProviderStateMixin {
  late SiteTheme _theme;
  late AnimationController _underlineAnimationController,
      _secondUnderlineAnimationController,
      _rRectAnimationController;

  @override
  void initState() {
    _theme = widget.theme!;
    _underlineAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _secondUnderlineAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _rRectAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    Future.delayed(const Duration(milliseconds: 300),
        () => _underlineAnimationController.forward());
    Future.delayed(const Duration(milliseconds: 3000),
        () => _secondUnderlineAnimationController.forward());
    _rRectAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _underlineAnimationController.dispose();
    _secondUnderlineAnimationController.dispose();
    _rRectAnimationController.dispose();
    super.dispose();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    Center(
                      child: CustomPaint(
                        painter: RRectDrawing(_rRectAnimationController,
                            _theme.drawingsOpacity, Colors.deepOrange),
                        child: Text(
                          "Hi! I'm Riccardo and I'm currently an high school student.\n"
                          'I always try to learn new technologies during my free time\n'
                          'as they come out. The main language I use is dart, with it\n'
                          'and Flutter I can design beautiful apps and websites.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: _width / 35,
                            color: _theme.titleTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _width > 800 ? 90 : 40),
                      child: CustomPaint(
                        painter: UnderlineDrawing(_underlineAnimationController,
                            _theme.drawingsOpacity, Colors.lightGreen),
                        child: Text(
                          'MAIN TECHNOLOGIES I USE',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: _width / 55,
                            color: _theme.secondTitleTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _width > 800 ? 90 : 40),
                      child: GridView.count(
                          crossAxisCount: _width > 1000
                              ? 4
                              : _width > 800
                                  ? 3
                                  : 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: _width > 1000 ? _width / 1900 : 0.8,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: getTechnologiesGridItems(
                              _theme, _width, _height)),
                    ),
                    const SizedBox(height: 100),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _width > 800 ? 50 : 0),
                      child: CustomPaint(
                        painter: UnderlineDrawing(
                            _secondUnderlineAnimationController,
                            _theme.drawingsOpacity,
                            Colors.amber),
                        child: Text(
                          'MAIN LANGUAGES I KNOW',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: _width / 55,
                            color: _theme.secondTitleTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _width > 800 ? 50 : 0),
                      child: GridView.count(
                          crossAxisCount: _width > 1000
                              ? 4
                              : _width > 800
                                  ? 3
                                  : 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: _width > 1000 ? _width / 1900 : 0.8,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children:
                              getLanguagesGridItems(_theme, _width, _height)),
                    ),
                    const SizedBox(height: 50),
                    Footer(
                      theme: _theme,
                      width: _width,
                      height: _height,
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

  List<Widget> getTechnologiesGridItems(
          SiteTheme theme, double width, double height) =>
      [
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'ANDROID STUDIO',
            contentText:
                'An IDE for building apps with Flutter, Java or Kotlin, developed by JetBrains and Google.',
            imagePath: 'technologies/android_studio.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'VISUAL STUDIO CODE',
            contentText:
                'A multi-purpose text editor that helps you write code in many languages, developed by Microsoft.',
            imagePath: 'technologies/visual_studio_code.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'SQLITE',
            contentText:
                'A SQL based databased used in flutter apps, thanks to the package SQLFLite.',
            imagePath: 'technologies/sqlite.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'CLOUD FIRESTORE',
            contentText:
                'A cloud based database developed by Google and used in various Flutter apps.',
            imagePath: 'technologies/cloud_firestore.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'GIT',
            contentText: 'A software version control.',
            imagePath: 'technologies/git.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'GIT HUB',
            contentText:
                'An online software sharing platform developed by Microsoft.',
            imagePath: 'technologies/github.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'VISUAL STUDIO 2022',
            contentText:
                'An IDE that helps you write C#, C++ and C code, developed by Microsoft.',
            imagePath: 'technologies/visual_studio_2019.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'UNITY',
            contentText: 'A game engine that helps you make games with C#.',
            imagePath: 'technologies/unity.svg'.changePath()),
      ];

  List<Widget> getLanguagesGridItems(
          SiteTheme theme, double width, double height) =>
      [
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'ARDUINO',
            contentText:
                'A language based on C that helps you program micro controllers.',
            imagePath: 'languages/arduino.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'C SHARP',
            contentText:
                'A language used to code games with unity and desktop applications with .NET.',
            imagePath: 'languages/c_sharp.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'CSS 3',
            contentText: 'A language that helps you style HTML components.',
            imagePath: 'languages/css3.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'HTML 5',
            contentText: 'A language that helps you structure websites.',
            imagePath: 'languages/html5.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'JAVA',
            contentText:
                'A multi purpose language that also helps you build mobile apps.',
            imagePath: 'languages/java.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'PYTHON',
            contentText:
                'A easy to learn language that is multi purpose like java.',
            imagePath: 'languages/python.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'JAVASCRIPT',
            contentText:
                'A language that controls websites. With it you can control animations and various elements of your website.',
            imagePath: 'languages/javascript.svg'.changePath()),
        GridItem(
            theme: theme,
            width: width,
            height: height,
            titleText: 'TYPESCRIPT',
            contentText:
                'A language very similar to javascript with variable types.',
            imagePath: 'languages/typescript.svg'.changePath()),
      ];
}

extension ChangePath on String {
  String changePath() {
    if (Foundation.kReleaseMode) {
      return 'assets/' + this;
    } else {
      return this;
    }
  }
}
