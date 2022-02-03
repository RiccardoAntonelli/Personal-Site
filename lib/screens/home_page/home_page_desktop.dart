import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import 'package:personal_site/screens/about_me_page/about_me_page.dart';
import 'package:personal_site/theme.dart';
import 'package:personal_site/utilities.dart';
import 'package:personal_site/widgets/footer.dart';
import 'package:personal_site/widgets/link_button.dart';
import 'package:personal_site/widgets/painters/first_drawings.dart';
import 'package:personal_site/widgets/painters/main_drawings.dart';
import 'package:personal_site/widgets/painters/second_drawings.dart';
import 'package:personal_site/widgets/painters/third_drawings.dart';
import 'package:personal_site/widgets/project_section.dart';

import 'home_page_main_text.dart';

class HomePageDesktop extends StatefulWidget {
  const HomePageDesktop({Key? key, this.theme, this.changeTheme})
      : super(key: key);

  final SiteTheme? theme;
  final Function? changeTheme;

  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop>
    with TickerProviderStateMixin {
  late SiteTheme _theme;
  late List<AnimationController> _animationControllers;
  late ScrollController _scrollController;

  @override
  void initState() {
    _theme = widget.theme!;
    _animationControllers = [
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000)),
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000)),
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000)),
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000)),
    ];
    _scrollController = ScrollController()..addListener(onScroll);
    _animationControllers[0].forward();
    super.initState();
  }

  @override
  void dispose() {
    for (AnimationController _controller in _animationControllers) {
      _controller.dispose();
    }
    _scrollController.removeListener(onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    if (_scrollController.hasClients) {
      if (_scrollController.offset >= (_height - 100)) {
        _animationControllers[1].forward();
      }
      if (_scrollController.offset >= (2 * _height - 100)) {
        _animationControllers[2].forward();
      }
      if (_scrollController.offset >= (3 * _height - 100)) {
        _animationControllers[3].forward();
      }
    }
    return Scaffold(
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
                    _animationControllers[0], _theme.drawingsOpacity),
                child: Center(
                  child: getMainText(fontSize: _width / 32, theme: _theme),
                ),
              ),
            ),
            Container(
              height: _height,
              width: double.infinity,
              color: _theme.secondBackgroundColor,
              child: CustomPaint(
                painter: FirstDrawings(
                    _animationControllers[1], _theme.drawingsOpacity),
                child: ProjectSection(
                  width: _width,
                  height: _height,
                  alignment: ProjectSectionAlignment.left,
                  image: Image.asset('school_app_screenshot.jpg'.changePath()),
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
                    _animationControllers[2], _theme.drawingsOpacity),
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
                    _animationControllers[3], _theme.drawingsOpacity),
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
                    _theme = changeTheme(_theme, widget.changeTheme!);
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
    );
  }

  void onScroll() {
    setState(() {});
  }
}
