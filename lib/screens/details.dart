import 'package:covid19tracker/utilities/constants.dart';
import 'package:covid19tracker/utilities/data_source.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff07213B),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff07213B),
        title: Text('FAQs'),
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              trailing: Icon(Icons.arrow_drop_down, color: Colors.white),
              title: Text(
                DataSource.questionAnswers[index]['question'],
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    DataSource.questionAnswers[index]['answer'],
                    style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                  ),
                )
              ],
            );
          }),
    );
  }
//
//  Widget getBody() {
//    var size = MediaQuery.of(context).size;
//    return Padding(
//        padding: EdgeInsets.only(top: 45),
//        child: SingleChildScrollView(
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              GestureDetector(
//                onTap: () {
//                  Navigator.pop(context);
//                },
//                child: Padding(
//                  padding: const EdgeInsets.only(left: 15),
//                  child: Icon(
//                    Icons.arrow_back_ios,
//                    color: Colors.white,
//                  ),
//                ),
//              ),
//              Container(
//                height: size.height,
//                child: Stack(
//                  children: <Widget>[
//                    Container(
//                      height: 200,
//                      child: Padding(
//                        padding: EdgeInsets.symmetric(horizontal: 30),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Text(
//                              "FAQ \nfor Covid19",
//                              style: appTitle,
//                            ),
//                            Image.asset(
//                                "assets/images/image_2_photos_v2_x2.png")
//                          ],
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top: 170),
//                      child: Container(
//                        width: double.infinity,
//                        decoration: BoxDecoration(
//                            color: bgColor,
//                            borderRadius: BorderRadius.only(
//                                topLeft: Radius.circular(70))),
//                        child: Padding(
//                          padding: EdgeInsets.symmetric(
//                            horizontal: 40,
//                          ),
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              SizedBox(
//                                height: 50,
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[0]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[0]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[1]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[1]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[2]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[2]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[3]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[3]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[4]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[4]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[5]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[5]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[6]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[6]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[7]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[7]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[8]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[8]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[9]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[9]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              ExpansionTile(
//                                trailing: Icon(Icons.arrow_drop_down,
//                                    color: Colors.white),
//                                title: Text(
//                                  DataSource.questionAnswers[10]['question'],
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(12.0),
//                                    child: Text(
//                                      DataSource.questionAnswers[10]['answer'],
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              )
//            ],
//          ),
//        ));
//  }
}
