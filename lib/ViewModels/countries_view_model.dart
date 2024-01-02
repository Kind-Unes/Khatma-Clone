import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:khatma_azkar/Models/azkar/azkar.dart';

class CountryViewModel extends ChangeNotifier {
  List<Country> countries = [];

  Future<void> fetchCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v2/all'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      countries = data.map((countryData) {
        return Country.fromJson(countryData);
      }).toList();
      notifyListeners();
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('Failed to load countries');
    }
  }
}
