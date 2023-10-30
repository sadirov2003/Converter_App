import 'package:equatable/equatable.dart';
import 'package:flutter_exchange_rates_app/converter/models/model.dart';

class ConverterState extends Equatable {
  final List<Model> currency;

  const ConverterState({
    this.currency = const [],
  });

  @override
  List<Object> get props => [currency];
}
