import 'package:json_annotation/json_annotation.dart';

part 'upcoming_dates.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DatesUpcoming {
  final String maximum;
  final String minimum;

  DatesUpcoming({
    required this.maximum,
    required this.minimum,
  });

  factory DatesUpcoming.fromJson(Map<String, dynamic> json) => _$DatesUpcomingFromJson(json);

  Map<String, dynamic> toJson() => _$DatesUpcomingToJson(this);

}
