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
  Source.IS_INSTALLED_FROM_PLAY_STORE: 'IS_INSTALLED_FROM_PLAY_STORE',
  Source.IS_INSTALLED_FROM_LOCAL_SOURCE: 'IS_INSTALLED_FROM_LOCAL_SOURCE',
  Source.IS_INSTALLED_FROM_AMAZON_APP_STORE:
      'IS_INSTALLED_FROM_AMAZON_APP_STORE',
  Source.IS_INSTALLED_FROM_HUAWEI_APP_GALLERY:
      'IS_INSTALLED_FROM_HUAWEI_APP_GALLERY',
  Source.IS_INSTALLED_FROM_SAMSUNG_GALAXY_STORE:
      'IS_INSTALLED_FROM_SAMSUNG_GALAXY_STORE',
  Source.IS_INSTALLED_FROM_OPPO_APP_MARKET: 'IS_INSTALLED_FROM_OPPO_APP_MARKET',
  Source.IS_INSTALLED_FROM_XIAOMI_GET_APPS: 'IS_INSTALLED_FROM_XIAOMI_GET_APPS',
  Source.IS_INSTALLED_FROM_VIVO_APP_STORE: 'IS_INSTALLED_FROM_VIVO_APP_STORE',
  Source.IS_INSTALLED_FROM_OTHER_SOURCE: 'IS_INSTALLED_FROM_OTHER_SOURCE',
  Source.IS_INSTALLED_FROM_APP_STORE: 'IS_INSTALLED_FROM_APP_STORE',
  Source.IS_INSTALLED_FROM_TEST_FLIGHT: 'IS_INSTALLED_FROM_TEST_FLIGHT',
  Source.IS_INSTALLED_FROM_APK_PURE: 'IS_INSTALLED_FROM_APK_PURE',
  Source.UNKNOWN: 'UNKNOWN',
};
