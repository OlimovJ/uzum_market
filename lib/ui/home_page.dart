import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_one/data/models/currency_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getDataFromApi() async {
    final response = await Dio().get('https://nbu.uz/en/exchange-rates/json/');
    List cerrencies = response.data
        .map((current_currency) => Currency.fromJson(current_currency))
        .toList();
    print(cerrencies[3].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          builder: (context, snapshot) {
            return const Center(child: Text("Salom"));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getDataFromApi();
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
