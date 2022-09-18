import 'package:json_annotation/json_annotation.dart';

part 'weather_status.g.dart';

@JsonSerializable()
class WeatherStatus{
  @JsonKey(name: 'text')
  final String? status;
  final String? icon;

  WeatherStatus({
    required this.status,
    required this.icon,
  });

  factory WeatherStatus.fromJson(Map<String, dynamic> json) => _$WeatherStatusFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherStatusToJson(this);
}