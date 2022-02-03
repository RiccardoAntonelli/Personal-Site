import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:personal_site/theme.dart';
import 'package:personal_site/utilities.dart';
import 'package:personal_site/widgets/footer.dart';
import 'package:personal_site/widgets/grid_item.dart';
import 'package:personal_site/widgets/painters/rrect_drawing.dart';
import 'package:personal_site/widgets/painters/underline_drawing.dart';

import 'about_me_grid_items.dart';

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
  late List<AnimationController> _animationControllers;
  late Stopwatch _stopwatch;
  late ScrollController _scrollController;
  final GlobalKey _firstContainerKey = GlobalKey();
  final GlobalKey _secondContainerKey = GlobalKey();
  late Timer _timer;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(onScroll);
    _theme = widget.theme!;
    _animationControllers = [
      AnimationController(
          vsync: this,
          duration:
              const Duration(milliseconds: 1000)), //RRect animation controller
      AnimationController(
          vsync: this,
          duration: const Duration(
              milliseconds: 500)), //First underline animation controller
      AnimationController(
          vsync: this,
          duration: const Duration(
              milliseconds: 500)), //Second underline animation controller
    ];
    _animationControllers[0].forward();
    _stopwatch = Stopwatch();
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

    if (_stopwatch.elapsedMilliseconds > 1700) {
      _stopwatch.stop();
      _timer.cancel();
    }

    if (_scrollController.hasClients) {
      if (_firstContainerKey.currentContext != null &&
          _secondContainerKey.currentContext != null) {
        final RenderBox _firstBox =
            _firstContainerKey.currentContext?.findRenderObject() as RenderBox;
        final double _firstBoxHeight = _firstBox.size.height;

        if (_scrollController.offset > 0) {
          _animationControllers[1].forward();
        }
        if (_scrollController.offset > _height) {
          _animationControllers[2].forward();
        }
        if (_scrollController.offset > _height + (_firstBoxHeight + 600)) {
          _stopwatch.start();
          _timer = Timer.periodic(const Duration(milliseconds: 400), (Timer t) {
            setState(() {});
          });
        }
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
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: _height,
                      child: Center(
                        child: CustomPaint(
                          painter: RRectDrawing(_animationControllers[0],
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
                    ),
                    const SizedBox(height: 100),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _width > 800 ? 90 : 40),
                      child: CustomPaint(
                        painter: UnderlineDrawing(_animationControllers[1],
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
                    SizedBox(
                      key: _firstContainerKey,
                      child: Padding(
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
                            childAspectRatio:
                                _width > 1000 ? _width / 1900 : 0.8,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: getTechnologiesGridItems(
                                _theme, _width, _height)),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _width > 800 ? 50 : 0),
                      child: CustomPaint(
                        painter: UnderlineDrawing(_animationControllers[2],
                            _theme.drawingsOpacity, Colors.amber),
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
                    SizedBox(
                      key: _secondContainerKey,
                      child: Padding(
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
                            childAspectRatio:
                                _width > 1000 ? _width / 1900 : 0.8,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children:
                                getLanguagesGridItems(_theme, _width, _height)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _width > 800 ? 50 : 0, vertical: 30.0),
                      child: Container(
                        child: Column(children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'technologies/flutter.svg'.changePath(),
                                width: _width / 10,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'FLUTTER, the main technology i know that helps me build apps for multiple platforms.',
                                    style: TextStyle(
                                        fontSize: _width / 50,
                                        color: _theme.titleTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: getPlatformsGridItems(
                                        _theme, _width, _height)
                                    .asMap()
                                    .map(
                                      (int index, GridItem gridItem) =>
                                          MapEntry(
                                        index,
                                        AnimatedOpacity(
                                          opacity:
                                              _stopwatch.elapsedMilliseconds >
                                                      (index * 400)
                                                  ? 1
                                                  : 0,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          child: gridItem,
                                        ),
                                      ),
                                    )
                                    .values
                                    .toList()),
                          )
                        ]),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _theme.secondBackgroundColor,
                        ),
                      ),
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
            ]),
          ),
        ]),
      ),
    );
  }

  void onScroll() {
    setState(() {});
  }
}
