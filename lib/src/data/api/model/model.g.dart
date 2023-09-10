// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      tjs: json['rates']['TJS'],
      usd: json['rates']['USD'],
      amd: json['rates']['AMD'],
      azn: json['rates']['AZN'],
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'USD': instance.usd,
      'TJS': instance.tjs,
      'AMD': instance.amd,
      'AZN': instance.azn,
    };
