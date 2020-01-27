import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Job.g.dart';
DateFormat _dateFormat = DateFormat('EEE MMM dd HH:mm:ssyyyy');
    DateTime _parseDate(String str) => _dateFormat.parse(str.replaceFirst(' UTC', ""), true);
@JsonSerializable(
  createToJson: false,
)
class Job {
  Job();
  String id;
  String type;
  String url;
  @JsonKey(name: 'created_at', fromJson: _parseDate)
  DateTime createdAt;
  String company;
  @JsonKey(name: 'company_url')
  String companyUrl;
  @JsonKey(name: 'company_logo')
  String companyLogo;
  String location;
  String title;
  String description;
  @JsonKey(name: 'how-to-apply')
  String howToApply;
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}