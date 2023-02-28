import 'package:flutter/foundation.dart';

class Airport {
  Airport({
    required this.iataCode,
    required this.name,
    required this.cityName,
    required this.countryName,
  });

  final String iataCode;
  final String name;
  final String cityName;
  final String countryName;

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      iataCode: json['iataCode'] as String,
      name: json['name'] as String,
      cityName: json['cityName'] as String,
      countryName: json['countryName'] as String,
    );
  }
}
