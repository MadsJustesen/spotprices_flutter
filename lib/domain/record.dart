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

  String kwhPrice() {
    double spotPrice =
        spotPriceDKK != 0.0 ? spotPriceDKK : spotPriceEUR * 7.4372;
    return (spotPrice / 1000).toStringAsFixed(2) + "kr";
  }
}
