import 'package:json_annotation/json_annotation.dart';
part 'Person.g.dart';
@JsonSerializable()
class Person {
  Person({this.firstName, this.lastName, this.email});
  final String firstName;
  final String lastName;
  final String email;
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
