import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({Key? key, this.theme, this.changeTheme})
      : super(key: key);

  final SiteTheme? theme;
  final Function? changeTheme;

  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile>
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
    _scrollController.dispose();
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
          child: ListView(
              controller: _scrollController,
              shrinkWrap: true,
              children: [
                Container(
                  height: _height,
                  width: double.infinity,
                  color: _theme.firstBackgroundColor,
                  child: CustomPaint(
                    painter: MainDrawings(
                        _animationControllers[0], _theme.drawingsOpacity, true),
                    child: Center(
                      child: SizedBox(
                        width: _width - 50,
                        child: Center(
                          child: getMainText(
                              fontSize: _width / 15,
                              theme: _theme,
                              context: context),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: _height,
                  width: _width,
                  color: _theme.secondBackgroundColor,
                  child: CustomPaint(
                    painter: FirstDrawings(
                        _animationControllers[1], _theme.drawingsOpacity),
                    child: ProjectSection(
                      width: _width,
                      height: _height,
                      imageHeight: _height / 2,
                      alignment: ProjectSectionAlignment.left,
                      image: Image.asset(AppLocalizations.of(context)!
                          .schoolAppScreenshotPath
                          .changePath()),
                      theme: _theme,
                      titleText: AppLocalizations.of(context)!.schoolAppTitle,
                      contentText:
                          AppLocalizations.of(context)!.schoolAppContent,
                      linkButtons: const SizedBox(),
                      isMobile: true,
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
                      imageHeight: 0,
                      alignment: ProjectSectionAlignment.right,
                      image: null,
                      theme: _theme,
                      titleText: AppLocalizations.of(context)!.chromeTabsTitle,
                      contentText:
                          AppLocalizations.of(context)!.chromeTabsContent,
                      linkButtons: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LinkButton(
                              url: AppLocalizations.of(context)!
                                  .chromeTabsGitHubURL,
                              backgroundColor: _theme.firstBackgroundColor,
                              textColor: _theme.buttonTextColor,
                              icon: Mdi.github,
                              buttonText: AppLocalizations.of(context)!
                                  .labelBtnViewOnGitHub),
                          const SizedBox(height: 50),
                          LinkButton(
                              url: AppLocalizations.of(context)!
                                  .chromeTabsVSCodeExtensionURL,
                              backgroundColor: _theme.firstBackgroundColor,
                              textColor: _theme.buttonTextColor,
                              icon: Mdi.microsoftVisualStudioCode,
                              buttonText: AppLocalizations.of(context)!
                                  .labelBtnViewVSCodeExtension),
                        ],
                      ),
                      isMobile: true,
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
                      imageHeight: _height / 2,
                      alignment: ProjectSectionAlignment.right,
                      image: null,
                      theme: _theme,
                      titleText:
                          AppLocalizations.of(context)!.personalSiteTitle,
                      contentText:
                          AppLocalizations.of(context)!.personalSiteContent,
                      linkButtons: LinkButton(
                          url: AppLocalizations.of(context)!
                              .personalSiteGitHubURL,
                          backgroundColor: _theme.firstBackgroundColor,
                          textColor: _theme.buttonTextColor,
                          icon: Mdi.github,
                          buttonText: AppLocalizations.of(context)!
                              .labelBtnViewOnGitHub),
                      isMobile: true,
                    ),
                  ),
                ),
                Footer(
                  theme: _theme,
                  width: _width,
                  height: _height,
                  isMobile: true,
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
                tooltip: AppLocalizations.of(context)!.tooltipBtnAboutMe,
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
                icon: _theme.isLight()
                    ? Icon(Icons.dark_mode_outlined,
                        color: _theme.appBarIconColor)
                    : Icon(Icons.light_mode_outlined,
                        color: _theme.appBarIconColor),
                tooltip: _theme.isLight()
                    ? AppLocalizations.of(context)!.tooltipBtnDarkMode
                    : AppLocalizations.of(context)!.tooltipBtnLightMode,
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
                  tooltip: AppLocalizations.of(context)!.tooltipBtnMyProjects,
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
