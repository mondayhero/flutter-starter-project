import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 1. Define asset paths in pubspec.yaml
/// ```yaml
/// dependencies:
///   flutter:
///     sdk: flutter

///   easy_localization: ^3.0.0 # Multi language
/// ```

/// 2. Complete the installation as instructed: https://pub.dev/packages/easy_localization

/// 3. Define asset paths in pubspec.yaml
/// ```yaml
/// # The following section is specific to Flutter.
/// flutter:
///   assets:
///     - assets/translations/
///     - assets/translations/mh_generated/
///     - assets/images/
/// ```

/// 4. Set path and assetLoader as below where you configured Easy Localization.
/// ```dart
/// EasyLocalization(
///   // ...
///   path: 'assets/translations',
///   assetLoader: const MHLocalizationAssetLoader(),
///   // ...
/// )

/// Sample project: https://github.com/mondayhero-support/mondayhero-starter-project
class MHLocalizationAssetLoader extends AssetLoader {
  const MHLocalizationAssetLoader();

  String getLocalePath(String basePath, Locale locale) {
    return '$basePath/${locale.toStringWithSeparator(separator: "-")}.json';
  }

  String getGeneratedLocalePath(String basePath, Locale locale) {
    return '$basePath/mh_generated/${locale.toStringWithSeparator(separator: "-")}.json';
  }

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async {
    EasyLocalization.logger.debug('Load asset from $path');

    final localePath = getLocalePath(path, locale);
    final generatedLocalePath = getGeneratedLocalePath(path, locale);

    dynamic appLocale, generatedLocale;

    try {
      appLocale = json.decode(await rootBundle.loadString(localePath));
    } catch (_) {
      appLocale = {};
      EasyLocalization.logger.debug('App localization file is not found in $path');
    }

    try {
      generatedLocale = json.decode(await rootBundle.loadString(generatedLocalePath));
    } catch (_) {
      generatedLocale = {};
      EasyLocalization.logger.debug('Generated localization file is not found in $path');
    }

    return {
      ...generatedLocale,
      ...appLocale,
    };
  }
}
