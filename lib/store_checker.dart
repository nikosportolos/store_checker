import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class AppSource {
  final Source source;
  final String name;

  const AppSource({required this.source, required this.name});
}

/* Source is where apk/ipa is available to Download */
enum Source {
  IS_INSTALLED_FROM_PLAY_STORE,
  IS_INSTALLED_FROM_LOCAL_SOURCE,
  IS_INSTALLED_FROM_AMAZON_APP_STORE,
  IS_INSTALLED_FROM_HUAWEI_APP_GALLERY,
  IS_INSTALLED_FROM_SAMSUNG_GALAXY_STORE,
  IS_INSTALLED_FROM_OPPO_APP_MARKET,
  IS_INSTALLED_FROM_XIAOMI_GET_APPS,
  IS_INSTALLED_FROM_VIVO_APP_STORE,
  IS_INSTALLED_FROM_OTHER_SOURCE,
  IS_INSTALLED_FROM_APP_STORE,
  IS_INSTALLED_FROM_TEST_FLIGHT,
  IS_INSTALLED_FROM_APK_PURE,
  UNKNOWN
}

/* Store Checker is useful to find the origin of installed apk/ipa */
class StoreChecker {
  static const MethodChannel _channel = const MethodChannel('store_checker');

  /* Get origin of installed apk/ipa */
  static Future<AppSource> get getSource async {
    final String? sourceName = await _channel.invokeMethod('getSource');
    late final Source source;

    if (Platform.isAndroid) {
      if (sourceName == null) {
        // Installed apk using adb commands or side loading or downloaded from any cloud service
        source = Source.IS_INSTALLED_FROM_LOCAL_SOURCE;
      } else if (sourceName.compareTo('com.android.vending') == 0) {
        // Installed apk from Google Play Store
        source = Source.IS_INSTALLED_FROM_PLAY_STORE;
      } else if (sourceName.compareTo('com.amazon.venezia') == 0) {
        // Installed apk from Amazon App Store
        source = Source.IS_INSTALLED_FROM_AMAZON_APP_STORE;
      } else if (sourceName.compareTo('com.huawei.appmarket') == 0) {
        // Installed apk from Huawei App Store
        source = Source.IS_INSTALLED_FROM_HUAWEI_APP_GALLERY;
      } else if (sourceName.compareTo('com.sec.android.app.samsungapps') == 0) {
        // Installed apk from Samsung App Store
        source = Source.IS_INSTALLED_FROM_SAMSUNG_GALAXY_STORE;
      } else if (sourceName.compareTo('com.oppo.market') == 0) {
        // Installed apk from Oppo App Store
        source = Source.IS_INSTALLED_FROM_OPPO_APP_MARKET;
      } else if (sourceName.compareTo('com.xiaomi.mipicks') == 0) {
        // Installed apk from Xiaomi App Store
        source = Source.IS_INSTALLED_FROM_XIAOMI_GET_APPS;
      } else if (sourceName.compareTo('com.vivo.appstore') == 0) {
        // Installed apk from Vivo App Store
        source = Source.IS_INSTALLED_FROM_VIVO_APP_STORE;
      } else if (sourceName.compareTo('com.apkpure.aegon') == 0) {
        // Installed apk from Pure APK
        source = Source.IS_INSTALLED_FROM_APK_PURE;
      } else {
        // Installed apk from Amazon app store or other markets
        source = Source.IS_INSTALLED_FROM_OTHER_SOURCE;
      }
    } else if (Platform.isIOS) {
      if (sourceName == null) {
        // Unknown source when null on iOS
        source = Source.UNKNOWN;
      } else if (sourceName.isEmpty) {
        // Downloaded ipa using cloud service and installed
        source = Source.IS_INSTALLED_FROM_LOCAL_SOURCE;
      } else if (sourceName.compareTo('AppStore') == 0) {
        // Installed ipa from App Store
        source = Source.IS_INSTALLED_FROM_APP_STORE;
      } else {
        // Installed ipa from Test Flight
        source = Source.IS_INSTALLED_FROM_TEST_FLIGHT;
      }
    }
    // Installed from Unknown source
    source = Source.UNKNOWN;

    return AppSource(
      source: source,
      name: sourceName ?? '',
    );
  }
}
