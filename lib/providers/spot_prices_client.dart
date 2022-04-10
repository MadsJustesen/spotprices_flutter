import 'package:http/http.dart' as http;
import 'package:spotprices_flutter/domain/record.dart';
import 'package:spotprices_flutter/domain/result.dart';
import 'dart:convert';

String sql =
    "SELECT * from \"elspotprices\" WHERE \"HourUTC\" > ((current_timestamp at time zone 'UTC') - INTERVAL '2 days')";
String baseUrl = "https://api.energidataservice.dk";
String path = "/datastore_search_sql";

Future<List<Record>> fetchSpotPrices() async {
  final response = await http.get(Uri.parse('$baseUrl$path?sql=$sql'));

  if (response.statusCode == 200) {
    return Result.fromJson(jsonDecode(response.body)).records.reversed.toList();
  } else {
    throw Exception('Failed to load record');
  }
}
