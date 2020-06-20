import 'package:covid19tracker/providers/country_provider.dart';
import 'package:covid19tracker/providers/daily_provider.dart';
import 'package:covid19tracker/providers/home_provider.dart';
import 'package:covid19tracker/providers/province_provider.dart';
import 'package:covid19tracker/screens/about_page.dart';
import 'package:covid19tracker/screens/indian_statistics.dart';
import 'package:covid19tracker/utilities/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateFormat fn = DateFormat("dd-MM-yyyy");
  String _selectedLocation = "IN";
  String datetime = '02-14-2020';

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    setState(() {
      datetime = fn.format(DateTime(now.year, now.month, now.day - 1));
    });
    Provider.of<HomeProvider>(context, listen: false).getHomeProvider();
    Provider.of<CountryProvider>(context, listen: false).getCountryProvider();
    Provider.of<DailyProvider>(context, listen: false)
        .getDailyProvider(datetime);
    Provider.of<ProvinceProvider>(context, listen: false)
        .getProvinceProvider(_selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    DateFormat f = DateFormat("dd-MM-yyyy HH:mm:ss");
    final nf = NumberFormat("#,###");
    var home = Provider.of<HomeProvider>(context).home;
    var daily = Provider.of<DailyProvider>(context).daily;
    var province = Provider.of<ProvinceProvider>(context).province;
    var country = Provider.of<CountryProvider>(context).country;

    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/covid19.png', height: 20.0),
          elevation: 0.0,
          backgroundColor: AppStyle.bg,
        ),
        body: Container(
          color: AppStyle.bg,
          padding: EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              if (home != null)
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Icon(Icons.timer, color: AppStyle.txg),
                        SizedBox(width: 2),
                        Text(f.format(home?.lastUpdate),
                            style: TextStyle(color: AppStyle.txg)),
                      ],
                    ),
                    titleWidget('Confirmed',
                        nf.format(home?.confirmed?.value) ?? '', AppStyle.txw),
                    titleWidget('Recovered',
                        nf.format(home?.recovered?.value) ?? '', AppStyle.txg),
                    titleWidget('Deaths', nf.format(home?.deaths?.value) ?? '',
                        AppStyle.txr),
                  ],
                ),
              SizedBox(height: 20),
              Card(
                color: Color(0xff3B4F55),
                child: Column(
                  children: <Widget>[
                    if (country != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Theme(
                          data: ThemeData(canvasColor: AppStyle.bgl),
                          child: DropdownButton(
                              isExpanded: true,
                              hint: Text(
                                'Please choose a location',
                                style: TextStyle(color: AppStyle.txg),
                              ),
                              value: _selectedLocation,
                              onChanged: (newValue) {
                                print(newValue);
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                                Provider.of<ProvinceProvider>(context,
                                        listen: false)
                                    .getProvinceProvider(newValue);
                              },
                              items: country.countries
                                  .map((val) => DropdownMenuItem(
                                        value: val.iso2,
                                        child: Text(
                                          val.name,
                                          style: TextStyle(
                                            color: AppStyle.txg,
                                          ),
                                        ),
                                      ))
                                  .toList()),
                        ),
                      ),
                    confirmDetail(
                      province?.confirmed?.value?.toString(),
                      province?.recovered?.value?.toString(),
                      province?.deaths?.value?.toString(),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IndianStatistics()));
                },
                child: Card(
                  color: Color(0xff3B4F55),
                  child: Container(
                    padding: EdgeInsets.only(left: 15.0, right: 20.0),
                    height: 60.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'View Indian Statistics',
                          style: TextStyle(
                            color: Color(0xff16DE93),
                            fontSize: 16.0,
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Divider(color: AppStyle.txw),
              ListTile(
                title: Text('Daily Cases', style: AppStyle.stdtw),
                trailing: InkWell(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2020, 1, 1),
                          maxTime: DateTime(2020, 12, 31), onConfirm: (date) {
                        setState(() {
                          datetime = fn.format(date);
                          Provider.of<DailyProvider>(context, listen: false)
                              .getDailyProvider(datetime);
                        });
                      }, currentTime: DateTime.now());
                    },
                    child: Text('Change $datetime',
                        style: TextStyle(color: AppStyle.txg))),
              ),
              if (daily != null)
                Column(
                    children: daily
                        .map((val) => Card(
                              color: AppStyle.bgl,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(val?.provinceState ?? '',
                                        style: AppStyle.stdtw),
                                    trailing: Text(val.countryRegion ?? '',
                                        style: AppStyle.stdtw),
                                  ),
                                  confirmDetail(
                                    val?.confirmed?.toString(),
                                    val?.recovered?.toString(),
                                    val?.deaths?.toString(),
                                  )
                                ],
                              ),
                            ))
                        .toList())
            ],
          ),
        ));
  }

  Widget confirmDetail(confirm, recovered, death) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Text('Confirmed', style: AppStyle.stdtw),
              Padding(
                padding: AppStyle.pv10,
                child: Text(confirm ?? '',
                    style: AppStyle.stdtb.copyWith(color: AppStyle.txw)),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text('Recovered', style: AppStyle.stdtw),
              Padding(
                padding: AppStyle.pv10,
                child: Text(recovered ?? '',
                    style: AppStyle.stdtb.copyWith(color: AppStyle.txg)),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text('Deaths', style: AppStyle.stdtw),
              Padding(
                padding: AppStyle.pv10,
                child: Text(death ?? '',
                    style: AppStyle.stdtb.copyWith(color: AppStyle.txr)),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget titleWidget(title, subtitle, color) {
    return ListTile(
      title: Text(title, style: AppStyle.stdtw),
      subtitle:
          Text(subtitle, style: AppStyle.subtitleMain.copyWith(color: color)),
    );
  }
}
