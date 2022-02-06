import 'package:flutter/foundation.dart' as foundation;
import 'package:personal_site/theme.dart';

extension ChangePath on String {
  String changePath() {
    if (foundation.kReleaseMode) {
      return 'assets/' + this;
    } else {
      return this;
    }
  }
}

SiteTheme changeTheme(SiteTheme currentTheme, Function changeTheme) {
  if (currentTheme.isDark()) {
    changeTheme(SiteTheme.light());
    return SiteTheme.light();
  } else {
    changeTheme(SiteTheme.dark());
    return SiteTheme.dark();
  }
}
