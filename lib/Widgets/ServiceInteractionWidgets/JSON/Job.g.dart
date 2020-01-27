// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job()
    ..id = json['id'] as String
    ..type = json['type'] as String
    ..url = json['url'] as String
    ..createdAt = _parseDate(json['created_at'] as String)
    ..company = json['company'] as String
    ..companyUrl = json['company_url'] as String
    ..companyLogo = json['company_logo'] as String
    ..location = json['location'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..howToApply = json['how-to-apply'] as String;
}
