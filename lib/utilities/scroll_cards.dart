import 'package:covid19tracker/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:covid19tracker/bloc/bloc.dart';

class ScrollCards extends StatelessWidget {
  final Size size;
  ScrollCards({this.size});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.responses,
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.hasData) {
          return scrollingCards(context, snapshot, size);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget scrollingCards(context, AsyncSnapshot snapshot, Size size) {
    List dataList = snapshot.data['regional'];
    return ListView.builder(
        itemCount: dataList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 15.0),
            width: size.width - 100,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  dataList[index]['loc'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff16DE93),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  'Confirmed Cases - Indian',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  dataList[index]['confirmedCasesIndian'].toString(),
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Confirmed Cases - Foreign',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  dataList[index]['confirmedCasesForeign'].toString(),
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Discharged',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  dataList[index]['discharged'].toString(),
                  style: Theme.of(context).textTheme.headline.copyWith(
                        color: Color(0xff16DE93),
                      ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Deaths',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  dataList[index]['deaths'].toString(),
                  style: Theme.of(context).textTheme.headline.copyWith(
                        color: Colors.red,
                      ),
                ),
              ],
            ),
          );
        });
  }
}
