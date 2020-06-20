import 'package:covid19tracker/bloc/bloc.dart';
import 'package:covid19tracker/screens/about_page.dart';
import 'package:covid19tracker/utilities/app_style.dart';
import 'package:covid19tracker/utilities/data.dart';
import 'package:covid19tracker/utilities/scroll_cards.dart';
import 'package:flutter/material.dart';

class IndianStatistics extends StatefulWidget {
  @override
  _IndianStatisticsState createState() => _IndianStatisticsState();
}

class _IndianStatisticsState extends State<IndianStatistics> {
  GetData data = GetData(url: 'https://api.rootnet.in/covid19-in/stats/latest');

  @override
  void initState() {
    super.initState();
    data.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        theme: ThemeData.dark(),
        home: SafeArea(
          child: Scaffold(
              backgroundColor: Color(0xff07213B),
              appBar: AppBar(
                backgroundColor: AppStyle.bg,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Column(
                children: <Widget>[
                  Expanded(
                    child: ScrollCards(size: size),
                  ),
                ],
              )),
        ));
  }
}
