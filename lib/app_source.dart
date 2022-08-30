import 'package:json_annotation/json_annotation.dart';
import 'package:store_checker/store_checker.dart';

part 'app_source.g.dart';

@JsonSerializable(explicitToJson: true)
class AppSource {
  final Source source;
  final String name;

  const AppSource({required this.source, required this.name});

  factory AppSource.fromJson(Map<String, dynamic> json) => _$AppSourceFromJson(json);
  Map<String, dynamic> toJson() => _$AppSourceToJson(this);
}
