// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSource _$AppSourceFromJson(Map<String, dynamic> json) => AppSource(
      source: $enumDecode(_$SourceEnumMap, json['source']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$AppSourceToJson(AppSource instance) => <String, dynamic>{
      'source': _$SourceEnumMap[instance.source]!,
      'name': instance.name,
    };

const _$SourceEnumMap = {
  Source.google_play_store: 'google_play_store',
  Source.google_package_installer: 'google_package_installer',
  Source.local_source: 'local_source',
  Source.amazon_app_store: 'amazon_app_store',
  Source.huawei_app_gallery: 'huawei_app_gallery',
  Source.samsung_galaxy_store: 'samsung_galaxy_store',
  Source.oppo_app_market: 'oppo_app_market',
  Source.xiaomi_get_apps: 'xiaomi_get_apps',
  Source.vivo_app_store: 'vivo_app_store',
  Source.other_source: 'other_source',
  Source.apple_app_store: 'apple_app_store',
  Source.apple_test_flight: 'apple_test_flight',
  Source.apk_pure: 'apk_pure',
  Source.cafe_bazaar: 'cafe_bazaar',
  Source.unknown: 'unknown',
};
