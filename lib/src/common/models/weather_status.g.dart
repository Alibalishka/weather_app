// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherStatus _$WeatherStatusFromJson(Map<String, dynamic> json) =>
    WeatherStatus(
      status: json['text'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherStatusToJson(WeatherStatus instance) =>
    <String, dynamic>{
      'text': instance.status,
      'icon': instance.icon,
    };
