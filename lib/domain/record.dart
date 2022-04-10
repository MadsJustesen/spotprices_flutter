import 'package:flutter/material.dart';

class Record {
  final double spotPriceEUR;
  final double spotPriceDKK;
  final String priceArea;
  final String hourUTC;
  final String hourDK;
  final int id;

  const Record(
      {required this.spotPriceEUR,
      required this.spotPriceDKK,
      required this.priceArea,
      required this.hourUTC,
      required this.hourDK,
      required this.id});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
        spotPriceEUR: json['SpotPriceEUR'],
        spotPriceDKK: json['SpotPriceDKK'] ?? 0.0,
        priceArea: json['PriceArea'],
        hourUTC: json['HourUTC'],
        hourDK: json['HourDK'],
        id: json['_id']);
  }

  double kwhPriceDKK() {
    return (spotPriceDKK != 0.0 ? spotPriceDKK : spotPriceEUR * 7.4372) / 1000;
  }

  String formattedPrice() {
    return kwhPriceDKK().toStringAsFixed(2) + "kr/kWh";
  }

  MaterialColor color() {
    if (kwhPriceDKK() > 2) {
      return Colors.red;
    } else if (kwhPriceDKK() > 1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
