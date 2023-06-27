import 'dart:convert';

import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'rest.coinapi.io';
const endUrlPath = 'v1/exchangerate';
const apiKey = '1EB31235-2A96-4870-BAA2-01739E5E08A3';

class CoinData {
  Future<Map<String, String>> getCoinData({currency = 'USD'}) async {
    Map<String, String> prices = {};
    for (String crypto in cryptoList) {
      Uri url = Uri.https(
          coinAPIURL, '$endUrlPath/$crypto/$currency', {'apikey': apiKey});
      Response response = await get(url);
      var lastPrice = '?';
      if (response.statusCode == 200) {
        String data = response.body;
        double price = jsonDecode(data)['rate'];
        lastPrice = price.toInt().toString();
      }
      prices[crypto] = lastPrice;
    }
    return prices;
  }
}
