import 'package:json_annotation/json_annotation.dart';

part 'app_source.g.dart';

@JsonSerializable(explicitToJson: true)
class AppSource {
  final Source source;
  final String name;

  const AppSource({required this.source, required this.name});

  factory AppSource.fromJson(Map<String, dynamic> json) => _$AppSourceFromJson(json);
  Map<String, dynamic> toJson() => _$AppSourceToJson(this);
}

/* Source is where apk/ipa is available to Download */
enum Source {
  google_play_store,
  google_package_installer,
  local_source,
  amazon_app_store,
  huawei_app_gallery,
  samsung_galaxy_store,
  oppo_app_market,
  xiaomi_get_apps,
  vivo_app_store,
  other_source,
  apple_app_store,
  apple_test_flight,
  apk_pure,
  cafe_bazaar,
  unknown
}
