import 'package:flutter/material.dart';
import '../domain/record.dart';
import '../providers/spot_prices_client.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Record>> futureRecords;

  @override
  void initState() {
    super.initState();
    futureRecords = fetchSpotPrices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful AF"),
      ),
      body: Center(
        child: FutureBuilder<List<Record>>(
            future: futureRecords,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: Text(snapshot.data![index].hourDK),
                        title:
                            Text(snapshot.data![index].kwhPrice().toString()),
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
