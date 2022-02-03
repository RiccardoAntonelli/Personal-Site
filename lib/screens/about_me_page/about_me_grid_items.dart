import 'package:flutter/material.dart';

import 'package:personal_site/utilities.dart';
import 'package:personal_site/widgets/grid_item.dart';
import 'package:personal_site/theme.dart';

List<GridItem> getTechnologiesGridItems(
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

List<GridItem> getPlatformsGridItems(
        SiteTheme theme, double width, double height) =>
    [
      GridItem(
          theme: theme,
          width: width,
          height: height,
          titleText: 'ANDROID',
          contentText: '',
          backgroundColor: theme.thirdBackgroundColor,
          imagePath: 'platforms/android_os.svg'.changePath()),
      GridItem(
          theme: theme,
          width: width,
          height: height,
          titleText: 'IOS',
          contentText: '',
          backgroundColor: theme.thirdBackgroundColor,
          imagePath: 'platforms/ios_logo.svg'.changePath()),
      GridItem(
          theme: theme,
          width: width,
          height: height,
          titleText: 'WEB',
          contentText: '',
          backgroundColor: theme.thirdBackgroundColor,
          imagePath: 'platforms/chrome.svg'.changePath()),
      GridItem(
          theme: theme,
          width: width,
          height: height,
          titleText: 'WINDOWS',
          contentText: '',
          backgroundColor: theme.thirdBackgroundColor,
          imagePath: 'platforms/windows_10.svg'.changePath()),
      GridItem(
          theme: theme,
          width: width,
          height: height,
          titleText: 'MAC OS',
          contentText: '',
          backgroundColor: theme.thirdBackgroundColor,
          imagePath: 'platforms/mac_os_logo.svg'.changePath()),
    ];
