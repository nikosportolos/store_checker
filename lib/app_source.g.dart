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
  Source.google_play_store: 'IS_INSTALLED_FROM_PLAY_STORE',
  Source.local_source: 'IS_INSTALLED_FROM_LOCAL_SOURCE',
  Source.amazon_app_store: 'IS_INSTALLED_FROM_AMAZON_APP_STORE',
  Source.huawei_app_gallery: 'IS_INSTALLED_FROM_HUAWEI_APP_GALLERY',
  Source.samsung_galaxy_store: 'IS_INSTALLED_FROM_SAMSUNG_GALAXY_STORE',
  Source.oppo_app_market: 'IS_INSTALLED_FROM_OPPO_APP_MARKET',
  Source.xiaomi_get_apps: 'IS_INSTALLED_FROM_XIAOMI_GET_APPS',
  Source.vivo_app_store: 'IS_INSTALLED_FROM_VIVO_APP_STORE',
  Source.other_source: 'IS_INSTALLED_FROM_OTHER_SOURCE',
  Source.apple_app_store: 'IS_INSTALLED_FROM_APP_STORE',
  Source.apple_test_flight: 'IS_INSTALLED_FROM_TEST_FLIGHT',
  Source.apk_pure: 'IS_INSTALLED_FROM_APK_PURE',
  Source.unknown: 'UNKNOWN',
};
