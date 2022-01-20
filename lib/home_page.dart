import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';
import 'package:personal_site/about_me_page.dart';
import 'package:personal_site/widgets/footer.dart';

import 'package:personal_site/widgets/link_button.dart';
import 'package:personal_site/widgets/painters/main_drawings.dart';
import 'package:personal_site/widgets/painters/first_drawings.dart';
import 'package:personal_site/theme.dart';
import 'package:personal_site/widgets/painters/second_drawings.dart';
import 'package:personal_site/widgets/painters/third_drawings.dart';
import 'package:personal_site/widgets/project_section.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  const HomePage({Key? key, this.theme, this.changeTheme}) : super(key: key);
  final SiteTheme? theme;
  final Function? changeTheme;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late SiteTheme _theme;
  late AnimationController _mainAnimationController,
      _firstAnimationController,
      _secondAnimationController,
      _thirdAnimationController;
  late ScrollController _scrollController;

  @override
  void initState() {
    _theme = widget.theme!;
    _mainAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _firstAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _secondAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _thirdAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _scrollController = ScrollController()..addListener(onScroll);
    _mainAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _mainAnimationController.dispose();
    _firstAnimationController.dispose();
    _secondAnimationController.dispose();
    _thirdAnimationController.dispose();
    _scrollController.removeListener(onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    if (_scrollController.hasClients) {
      if (_scrollController.offset >= (_height - 100)) {
        _firstAnimationController.forward();
      }
      if (_scrollController.offset >= (2 * _height - 100)) {
        _secondAnimationController.forward();
      }
      if (_scrollController.offset >= (3 * _height - 100)) {
        _thirdAnimationController.forward();
      }
    }

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
            child: ListView(controller: _scrollController, children: [
              Container(
                height: _height,
                width: double.infinity,
                color: _theme.firstBackgroundColor,
                child: CustomPaint(
                  painter: MainDrawings(
                      _mainAnimationController, _theme.drawingsOpacity),
                  child: Center(
                    child: getMainText(width: _width),
                  ),
                ),
              ),
              Container(
                height: _height,
                width: double.infinity,
                color: _theme.secondBackgroundColor,
                child: CustomPaint(
                  painter: FirstDrawings(
                      _firstAnimationController, _theme.drawingsOpacity),
                  child: ProjectSection(
                    width: _width,
                    height: _height,
                    alignment: ProjectSectionAlignment.left,
                    image:
                        Image.asset('school_app_screenshot.jpg'.changePath()),
                    theme: _theme,
                    titleText: 'School app',
                    contentText:
                        'An app that lets you manage all your grades and subjects.\n'
                        'It has a calendar from witch you can view all the upcoming\n'
                        'tests and it can store all your grades with description\n'
                        'and attachments. This app was made with Flutter and coded\n'
                        'in Dart and uses firestore storage. All your data is saved\n'
                        'securely on the cloud so you can log in with multiple devices\n'
                        'and have them synchronized. You can also log in with Google.\n'
                        'This project is still WIP',
                    linkButtons: const SizedBox(),
                  ),
                ),
              ),
              Container(
                height: _height,
                width: double.infinity,
                color: _theme.firstBackgroundColor,
                child: CustomPaint(
                  painter: SecondDrawings(
                      _secondAnimationController, _theme.drawingsOpacity),
                  child: ProjectSection(
                    width: _width,
                    height: _height,
                    alignment: ProjectSectionAlignment.right,
                    image: Image.asset(
                      'chrome_tabs_screenshot.png'.changePath(),
                      width: _width / 2,
                    ),
                    theme: _theme,
                    titleText: 'Chrome tabs',
                    contentText:
                        'An extension for Visual Studio Code that integrates\n'
                        'websites into the editor. With this extension developed\n'
                        'with Type Script you can save multiple websites and have\n'
                        'them near your lines of code. With this extension you\n'
                        "don't need to have multiple windows open because it's\n"
                        'all built into VS Code.',
                    linkButtons: _width > 600
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LinkButton(
                                  url:
                                      'https://github.com/RiccardoAntonelli/chrome_tabs',
                                  backgroundColor: _theme.firstBackgroundColor,
                                  textColor: _theme.buttonTextColor,
                                  icon: Mdi.github,
                                  buttonText: 'View on GitHub'),
                              const SizedBox(width: 50),
                              LinkButton(
                                  url:
                                      'https://marketplace.visualstudio.com/items?itemName=RiccardoAntonelli.chrome-tabs',
                                  backgroundColor: _theme.firstBackgroundColor,
                                  textColor: _theme.buttonTextColor,
                                  icon: Mdi.microsoftVisualStudioCode,
                                  buttonText: 'View VS Code extension'),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 80),
                              LinkButton(
                                  url:
                                      'https://github.com/RiccardoAntonelli/chrome_tabs',
                                  backgroundColor: _theme.firstBackgroundColor,
                                  textColor: _theme.buttonTextColor,
                                  icon: Mdi.github,
                                  buttonText: 'View on GitHub'),
                              const SizedBox(height: 50),
                              LinkButton(
                                  url:
                                      'https://marketplace.visualstudio.com/items?itemName=RiccardoAntonelli.chrome-tabs',
                                  backgroundColor: _theme.firstBackgroundColor,
                                  textColor: _theme.buttonTextColor,
                                  icon: Mdi.microsoftVisualStudioCode,
                                  buttonText: 'View VS Code extension'),
                            ],
                          ),
                  ),
                ),
              ),
              Container(
                height: _height,
                width: double.infinity,
                color: _theme.secondBackgroundColor,
                child: CustomPaint(
                  painter: ThirdDrawings(
                      _thirdAnimationController, _theme.drawingsOpacity),
                  child: ProjectSection(
                    width: _width,
                    height: _height,
                    alignment: ProjectSectionAlignment.right,
                    image: null,
                    theme: _theme,
                    titleText: 'Personal site',
                    contentText:
                        'This website is one of my projects and it is built\n'
                        'entirely with Flutter. It includes custom shapes and\n'
                        'animations to make it more engaging.',
                    linkButtons: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LinkButton(
                              url:
                                  'https://github.com/RiccardoAntonelli/chrome_tabs',
                              backgroundColor: _theme.firstBackgroundColor,
                              textColor: _theme.buttonTextColor,
                              icon: Mdi.github,
                              buttonText: 'View on GitHub'),
                        ]),
                  ),
                ),
              ),
              Footer(
                theme: _theme,
                width: _width,
                height: _height,
              ),
            ]),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Row(children: [
              Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AboutMePage.route);
                  },
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: _theme.appBarIconColor,
                  ),
                  tooltip: 'About me',
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
              Visibility(
                visible: _scrollController.hasClients,
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      _scrollController.jumpTo(_height);
                    },
                    icon: Icon(
                      Icons.build_outlined,
                      color: _theme.appBarIconColor,
                    ),
                    tooltip: 'My projects',
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _theme.appBarButtonColor,
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget getMainText({required double width}) {
    double _fontSize = width > 600 ? width / 32 : width / 22;

    return SizedBox(
      width: width > 600 ? double.infinity : width - 160,
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Hi, I'm ",
              style: TextStyle(
                color: _theme.textColor,
                fontSize: _fontSize,
              ),
              children: [
                TextSpan(
                  text: 'Riccardo Antonelli',
                  style: TextStyle(
                    color: _theme.titleTextColor,
                  ),
                ),
                TextSpan(
                  text: " and I'm 17.\nI am a ",
                  style: TextStyle(
                    color: _theme.textColor,
                  ),
                ),
                TextSpan(
                  text: 'full-stack developer',
                  style: TextStyle(
                    color: _theme.titleTextColor,
                  ),
                ),
                TextSpan(
                  text: ' and a student.',
                  style: TextStyle(
                    color: _theme.textColor,
                  ),
                ),
              ]),
        ),
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

  void onScroll() {
    setState(() {});
  }
}
