import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exchange_rates_app/converter/bloc/converter_event.dart';
import 'package:flutter_exchange_rates_app/converter/bloc/converter_state.dart';
import 'package:flutter_exchange_rates_app/converter/models/model.dart';
import 'package:http/http.dart' as http;

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc() : super(const ConverterState()) {
    on<ConverterFetchedEvent>(_onChangeRatesRequest);
  }

  static String apiKey = 'XPSx7HCnbi6JxiP6pE90Rv21nK6CJqE2';
  static String url =
      'https://api.apilayer.com/exchangerates_data/latest?symbols=TJS,USD,AMD,AZN&base=RUB&apikey=$apiKey';

  Future<void> _onChangeRatesRequest(
      ConverterFetchedEvent event, Emitter<ConverterState> emit) async {
    final List<Model> _listRates = [];
    final rates = await _changeRatesRequest();
    _listRates.add(rates);
    emit(ConverterState(currency: _listRates));
  }

  Future<Model> _changeRatesRequest() async {
    final urlParsed = Uri.parse(url);
    final response = await http.get(urlParsed);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      return Model.fromJson(jsonData);
    } else {
      throw Exception('Приозошло ошибка при получения данных');
    }
  }
}
