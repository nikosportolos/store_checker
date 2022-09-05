import 'package:store_checker/app_source.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';

export 'app_source.dart';

/// Store Checker is useful to find the origin of installed apk/ipa
class StoreChecker {
  static const MethodChannel _channel = const MethodChannel('store_checker');

  /// Get origin of installed apk/ipa
  static Future<AppSource> get getSource async {
    final String? sourceName = await _channel.invokeMethod('getSource');
    Source source = Source.unknown; // Installed from Unknown source

    if (Platform.isAndroid) {
      source = _getAndroidSource(sourceName);
    } else if (Platform.isIOS) {
      source = _getAppleSource(sourceName);
    }

    return AppSource(
      source: source,
      name: sourceName ?? '',
    );
  }

  /// Get installation source for Android application
  static Source _getAndroidSource(String? sourceName) {
    late final Source source;

    if (sourceName == null) {
      // Installed apk using adb commands or side loading or downloaded from any cloud service
      source = Source.local_source;
    } else if (sourceName.compareTo('com.android.vending') == 0) {
      // Installed apk from Google Play Store
      source = Source.google_play_store;
    } else if (sourceName.compareTo('com.google.android.packageinstaller') == 0) {
      // Installed apk from Google Package Installer (Firebase App Distribution)
      source = Source.google_package_installer;
    } else if (sourceName.compareTo('com.amazon.venezia') == 0) {
      // Installed apk from Amazon App Store
      source = Source.amazon_app_store;
    } else if (sourceName.compareTo('com.huawei.appmarket') == 0) {
      // Installed apk from Huawei App Store
      source = Source.huawei_app_gallery;
    } else if (sourceName.compareTo('com.sec.android.app.samsungapps') == 0) {
      // Installed apk from Samsung App Store
      source = Source.samsung_galaxy_store;
    } else if (sourceName.compareTo('com.oppo.market') == 0) {
      // Installed apk from Oppo App Store
      source = Source.oppo_app_market;
    } else if (sourceName.compareTo('com.xiaomi.mipicks') == 0) {
      // Installed apk from Xiaomi App Store
      source = Source.xiaomi_get_apps;
    } else if (sourceName.compareTo('com.vivo.appstore') == 0) {
      // Installed apk from Vivo App Store
      source = Source.vivo_app_store;
    } else if (sourceName.compareTo('com.apkpure.aegon') == 0) {
      // Installed apk from Pure APK
      source = Source.apk_pure;
    } else if (sourceName.compareTo('com.farsitel.bazaar') == 0) {
      // Installed apk from Cafe Bazaar
      source = Source.cafe_bazaar;
    } else {
      // Installed apk from other markets
      source = Source.other_source;
    }

    return source;
  }

  /// Get installation source for iOS application
  static Source _getAppleSource(String? sourceName) {
    late final Source source;

    if (sourceName == null) {
      // Unknown source when null on iOS
      source = Source.unknown;
    } else if (sourceName.isEmpty) {
      // Downloaded ipa using cloud service and installed
      source = Source.local_source;
    } else if (sourceName.compareTo('AppStore') == 0) {
      // Installed ipa from App Store
      source = Source.apple_app_store;
    } else {
      // Installed ipa from Test Flight
      source = Source.apple_test_flight;
    }

    return source;
  }
}
