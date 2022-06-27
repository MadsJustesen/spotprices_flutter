import 'package:flutter/material.dart';
import '../domain/record.dart';
import '../providers/spot_prices_client.dart';

class LatestPricesWidget extends StatefulWidget {
  const LatestPricesWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LatestPriceWidgetState();
}

class _LatestPriceWidgetState extends State<LatestPricesWidget> {
  late Future<List<Record>> futureRecords;

  @override
  void initState() {
    super.initState();
    futureRecords = fetchSpotPrices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Record>>(
            future: futureRecords,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PricesListView(snapshot: snapshot);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

class PricesListView extends StatelessWidget {
  const PricesListView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<List<Record>> snapshot;

  @override
  Widget build(BuildContext context) {
    List<Record> items = snapshot.data ?? [];
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          Record record = items[index];
          return ListTile(
            tileColor: record.color(),
            trailing: Text(record.formattedHourDK()),
            title: Text(record.formattedPrice()),
          );
        });
  }
}
