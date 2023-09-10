import 'dart:convert';

import 'package:flutter_exchange_rates_app/src/data/api/model/model.dart';
import 'package:http/http.dart' as http;

class ExchangeRatesService {
  static String apiKey = 'XPSx7HCnbi6JxiP6pE90Rv21nK6CJqE2';
  static String url =
      'https://api.apilayer.com/exchangerates_data/latest?symbols=TJS,USD,AMD,AZN&base=RUB&apikey=$apiKey';

  Future<Model> getSource() async {
    final urlParsed = Uri.parse(url);
    final response = await http.get(urlParsed);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      return Model.fromJson(jsonData);
    } else {
      throw Exception('Произошло ошибка при получения данных');
    }
  }
}
