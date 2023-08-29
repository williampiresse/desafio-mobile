import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLocalizationUtils {
  AppLocalizationUtils._internal();

  static final AppLocalizationUtils _singleton =
      AppLocalizationUtils._internal();

  static AppLocalizationUtils get instance => _singleton;

  AppLocalizations getLocalization(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
