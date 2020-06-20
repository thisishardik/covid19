import 'package:covid19tracker/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:covid19tracker/providers/country_provider.dart';
import 'package:covid19tracker/providers/daily_provider.dart';
import 'package:covid19tracker/providers/home_provider.dart';
import 'package:covid19tracker/providers/province_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => DailyProvider()),
      ChangeNotifierProvider(create: (_) => ProvinceProvider()),
      ChangeNotifierProvider(create: (_) => CountryProvider()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}
