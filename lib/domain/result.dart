import './record.dart';

class Result {
  final List<Record> records;

  const Result({required this.records});

  factory Result.fromJson(Map<String, dynamic> json) {
    var list = json['result']['records'] as List;
    return Result(records: list.map((it) => Record.fromJson(it)).toList());
  }
}
