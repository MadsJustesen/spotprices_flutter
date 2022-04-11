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
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: snapshot.data![index].color(),
                        trailing: Text(snapshot.data![index].hourDK),
                        title: Text(snapshot.data![index].formattedPrice()),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
