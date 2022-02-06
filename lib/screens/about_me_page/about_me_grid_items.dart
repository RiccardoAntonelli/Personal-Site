import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_site/theme.dart';
import 'package:personal_site/utilities.dart';
import 'package:personal_site/widgets/grid_item.dart';

List<GridItem> getTechnologiesGridItems(SiteTheme theme, double width,
        double height, BuildContext context, bool isMobile) =>
    [
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.androidStudioTitle,
        contentText: AppLocalizations.of(context)!.androidStudioContent,
        imagePath:
            AppLocalizations.of(context)!.androidStudioIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.vSCodeTitle,
        contentText: AppLocalizations.of(context)!.vSCodeContent,
        imagePath: AppLocalizations.of(context)!.vSCodeIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.sQLiteTitle,
        contentText: AppLocalizations.of(context)!.sQLiteContent,
        imagePath: AppLocalizations.of(context)!.sQLiteIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.firestoreTitle,
        contentText: AppLocalizations.of(context)!.firestoreContent,
        imagePath: AppLocalizations.of(context)!.firestoreIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.gITTitle,
        contentText: AppLocalizations.of(context)!.gITContent,
        imagePath: AppLocalizations.of(context)!.gITIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.gitHubTitle,
        contentText: AppLocalizations.of(context)!.gitHubContent,
        imagePath: AppLocalizations.of(context)!.gitHubIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.vS2022Title,
        contentText: AppLocalizations.of(context)!.vS2022HubContent,
        imagePath: AppLocalizations.of(context)!.vS2022HubIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.unityTitle,
        contentText: AppLocalizations.of(context)!.unityHubContent,
        imagePath: AppLocalizations.of(context)!.unityHubIconPath.changePath(),
        isMobile: isMobile,
      ),
    ];

List<Widget> getLanguagesGridItems(SiteTheme theme, double width, double height,
        BuildContext context, bool isMobile) =>
    [
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.arduinoTitle,
        contentText: AppLocalizations.of(context)!.arduinoContent,
        imagePath: AppLocalizations.of(context)!.arduinoIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.cSharpTitle,
        contentText: AppLocalizations.of(context)!.cSharpContent,
        imagePath: AppLocalizations.of(context)!.cSharpIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.cSSTitle,
        contentText: AppLocalizations.of(context)!.cSSContent,
        imagePath: AppLocalizations.of(context)!.cSSIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.hTMLTitle,
        contentText: AppLocalizations.of(context)!.hTMLContent,
        imagePath: AppLocalizations.of(context)!.hTMLIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.javaTitle,
        contentText: AppLocalizations.of(context)!.javaContent,
        imagePath: AppLocalizations.of(context)!.javaIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.pythonTitle,
        contentText: AppLocalizations.of(context)!.pythonContent,
        imagePath: AppLocalizations.of(context)!.pythonIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.javaScriptTitle,
        contentText: AppLocalizations.of(context)!.javaScriptContent,
        imagePath:
            AppLocalizations.of(context)!.javaScriptIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.typeScriptTitle,
        contentText: AppLocalizations.of(context)!.typeScriptContent,
        imagePath:
            AppLocalizations.of(context)!.typeScriptIconPath.changePath(),
        isMobile: isMobile,
      ),
    ];

List<GridItem> getPlatformsGridItems(SiteTheme theme, double width,
        double height, BuildContext context, bool isMobile) =>
    [
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.androidTitle,
        contentText: AppLocalizations.of(context)!.androidContent,
        backgroundColor: theme.thirdBackgroundColor,
        imagePath: AppLocalizations.of(context)!.androidIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.iOSTitle,
        contentText: AppLocalizations.of(context)!.iOSContent,
        backgroundColor: theme.thirdBackgroundColor,
        imagePath: AppLocalizations.of(context)!.iOSIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.webTitle,
        contentText: AppLocalizations.of(context)!.webContent,
        backgroundColor: theme.thirdBackgroundColor,
        imagePath: AppLocalizations.of(context)!.webIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.windowsTitle,
        contentText: AppLocalizations.of(context)!.windowsContent,
        backgroundColor: theme.thirdBackgroundColor,
        imagePath: AppLocalizations.of(context)!.windowsIconPath.changePath(),
        isMobile: isMobile,
      ),
      GridItem(
        theme: theme,
        width: width,
        height: height,
        titleText: AppLocalizations.of(context)!.macOsTitle,
        contentText: AppLocalizations.of(context)!.macOsContent,
        backgroundColor: theme.thirdBackgroundColor,
        imagePath: AppLocalizations.of(context)!.macOsIconPath.changePath(),
        isMobile: isMobile,
      ),
    ];
