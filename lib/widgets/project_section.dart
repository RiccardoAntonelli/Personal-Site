import 'package:flutter/material.dart';
import 'package:personal_site/theme.dart';

enum ProjectSectionAlignment { left, right }

class ProjectSection extends StatelessWidget {
  final ProjectSectionAlignment alignment;
  final double height, width, imageHeight;
  final SiteTheme theme;
  final Widget? image;
  final String titleText, contentText;
  final Widget linkButtons;
  final bool isMobile;

  const ProjectSection({
    Key? key,
    this.alignment = ProjectSectionAlignment.left,
    required this.height,
    required this.width,
    required this.theme,
    required this.image,
    required this.titleText,
    required this.contentText,
    required this.linkButtons,
    required this.imageHeight,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _titleFontSize = isMobile ? width / 10 : width / 20;
    double _contentFontSize = isMobile ? width / 31 : width / 60;

    switch (alignment) {
      case ProjectSectionAlignment.right:
        if (isMobile) {
          return _rightAlignedMobileLayout(_titleFontSize, _contentFontSize);
        } else {
          return _rightAlignedDesktopLayout(_titleFontSize, _contentFontSize);
        }
      case ProjectSectionAlignment.left:
        if (isMobile) {
          return _leftAlignedMobileLayout(_titleFontSize, _contentFontSize);
        } else {
          return _leftAlignedDesktopLayout(_titleFontSize, _contentFontSize);
        }
    }
  }

  Widget _rightAlignedDesktopLayout(
      double titleFontSize, double contentFontSize) {
    return SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: image != null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: imageHeight,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), child: image),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(
                        color: theme.titleTextColor, fontSize: titleFontSize),
                  ),
                  const SizedBox(height: 50),
                  Flexible(
                    child: Text(
                      contentText,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          color: theme.textColor, fontSize: contentFontSize),
                    ),
                  ),
                  const SizedBox(height: 30),
                  linkButtons
                ],
              ),
            ),
          ],
        ));
  }

  Widget _leftAlignedDesktopLayout(
      double titleFontSize, double contentFontSize) {
    return SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(
                        color: theme.titleTextColor, fontSize: titleFontSize),
                  ),
                  const SizedBox(height: 50),
                  Flexible(
                    child: Text(
                      contentText,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          color: theme.textColor, fontSize: contentFontSize),
                    ),
                  ),
                  const SizedBox(height: 30),
                  linkButtons
                ],
              ),
            ),
            Visibility(
              visible: image != null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: imageHeight,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), child: image),
              ),
            ),
          ],
        ));
  }

  Widget _rightAlignedMobileLayout(
      double titleFontSize, double contentFontSize) {
    return SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(
                        color: theme.titleTextColor, fontSize: titleFontSize),
                  ),
                  const SizedBox(height: 50),
                  Flexible(
                    child: Text(
                      contentText,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          color: theme.textColor, fontSize: contentFontSize),
                    ),
                  ),
                  const SizedBox(height: 30),
                  linkButtons
                ],
              ),
            ),
            Visibility(
              visible: image != null,
              child: SizedBox(
                height: imageHeight,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), child: image),
              ),
            ),
          ],
        ));
  }

  Widget _leftAlignedMobileLayout(
      double titleFontSize, double contentFontSize) {
    return SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(
                        color: theme.titleTextColor, fontSize: titleFontSize),
                  ),
                  const SizedBox(height: 50),
                  Flexible(
                    child: Text(
                      contentText,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          color: theme.textColor, fontSize: contentFontSize),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Visibility(
                    visible: image != null,
                    child: SizedBox(
                      height: imageHeight,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: image),
                    ),
                  ),
                  const SizedBox(height: 30),
                  linkButtons
                ],
              ),
            ),
          ],
        ));
  }
}
