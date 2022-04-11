import 'package:flutter/material.dart';
import '../widgets/latest_prices.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(child: LatestPricesWidget()),
    );
  }
}
