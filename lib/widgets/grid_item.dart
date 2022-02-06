import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_site/theme.dart';

class GridItem extends StatelessWidget {
  const GridItem(
      {Key? key,
      required this.theme,
      required this.width,
      required this.height,
      required this.imagePath,
      required this.titleText,
      required this.contentText,
      required this.isMobile,
      this.backgroundColor})
      : super(key: key);
  final SiteTheme theme;
  final double width, height;
  final bool isMobile;
  final String imagePath, titleText, contentText;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: isMobile ? width / 4 : width / 10,
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SvgPicture.asset(
              imagePath,
              width: isMobile ? width / 4 : width / 10,
            ),
          ),
        ),
        Center(
          child: Column(children: [
            Text(
              titleText,
              style: TextStyle(
                color: theme.titleTextColor,
                fontSize: isMobile ? width / 26 : width / 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                contentText,
                style: TextStyle(
                  color: theme.textColor,
                  fontSize: isMobile ? width / 40 : width / 80,
                ),
              ),
            )
          ]),
        ),
      ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor ?? theme.secondBackgroundColor,
      ),
    );
  }
}
