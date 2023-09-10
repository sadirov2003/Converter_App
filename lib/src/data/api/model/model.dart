import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  final double tjs;
  final double usd;
  final double amd;
  final double azn;

  Model({
    required this.usd,
    required this.tjs,
    required this.amd,
    required this.azn
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return _$ModelFromJson(json);
  }
}
