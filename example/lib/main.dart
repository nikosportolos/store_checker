import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:store_checker/store_checker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String source = 'None';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    Source installationSource;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //get origin of installed application
      installationSource = (await StoreChecker.getSource).source;
    } on PlatformException {
      installationSource = Source.unknown;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // Set source text state
    setState(() {
      switch (installationSource) {
        case Source.google_play_store:
          // Installed from Play Store
          source = "Play Store";
          break;
        case Source.local_source:
          // Installed using adb commands or side loading or any cloud service
          source = "Local Source";
          break;
        case Source.amazon_app_store:
          // Installed from Amazon app store
          source = "Amazon Store";
          break;
        case Source.huawei_app_gallery:
          // Installed from Huawei app store
          source = "Huawei App Gallery";
          break;
        case Source.samsung_galaxy_store:
          // Installed from Samsung app store
          source = "Samsung Galaxy Store";
          break;
        case Source.xiaomi_get_apps:
          // Installed from Xiaomi app store
          source = "Xiaomi Get Apps";
          break;
        case Source.oppo_app_market:
          // Installed from Oppo app store
          source = "Oppo App Market";
          break;
        case Source.vivo_app_store:
          // Installed from Vivo app store
          source = "Vivo App Store";
          break;
        case Source.other_source:
          // Installed from other market store
          source = "Other Source";
          break;
        case Source.apple_app_store:
          // Installed from iOS app store
          source = "App Store";
          break;
        case Source.apple_test_flight:
          // Installed from Test Flight
          source = "Test Flight";
          break;
        case Source.unknown:
          // Installed from Unknown source
          source = "Unknown Source";
          break;
        case Source.apk_pure:
          source = "APK Pure";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Installed from: $source\n'),
        ),
      ),
    );
  }
}
