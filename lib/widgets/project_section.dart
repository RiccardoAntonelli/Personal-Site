import 'package:flutter/material.dart';

import 'package:personal_site/theme.dart';

enum ProjectSectionAlignment { left, right }

class ProjectSection extends StatelessWidget {
  final ProjectSectionAlignment alignment;
  final double height, width;
  final SiteTheme theme;
  final Widget? image;
  final String titleText, contentText;
  final Widget linkButtons;

  const ProjectSection(
      {Key? key,
      this.alignment = ProjectSectionAlignment.left,
      required this.height,
      required this.width,
      required this.theme,
      required this.image,
      required this.titleText,
      required this.contentText,
      required this.linkButtons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (alignment) {
      case ProjectSectionAlignment.right:
        return SizedBox(
            child: Row(
          mainAxisAlignment: image != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: image != null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: height - 40,
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
                        color: theme.titleTextColor, fontSize: width / 20),
                  ),
                  const SizedBox(height: 50),
                  Flexible(
                    child: Text(
                      contentText,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          color: theme.textColor, fontSize: width / 60),
                    ),
                  ),
                  const SizedBox(height: 30),
                  linkButtons
                ],
              ),
            ),
          ],
        ));
      case ProjectSectionAlignment.left:
        return SizedBox(
            child: Row(
          mainAxisAlignment: image != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
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
                        color: theme.titleTextColor, fontSize: width / 20),
                  ),
                  const SizedBox(height: 50),
                  Flexible(
                    child: Text(
                      contentText,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          color: theme.textColor, fontSize: width / 60),
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
                height: height - 40,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), child: image),
              ),
            ),
          ],
        ));
    }
  }
}
