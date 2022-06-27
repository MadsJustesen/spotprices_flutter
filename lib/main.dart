import 'package:flutter/material.dart';
import 'package:spotprices_flutter/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spot Priser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Spot Priser'),
    );
  }
}
