import 'package:covid19tracker/screens/home_page.dart';
import 'package:covid19tracker/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff07213B),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 18.0,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15.0),
              Image.asset(
                "assets/images/intro.png",
                fit: BoxFit.cover,
                height: 250.0,
              ),
              Spacer(),
              Text(
                "Save yourself\nSave the World\n",
                style:
                    kTitleStyle.copyWith(fontSize: 25.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                "COVID-19 is an infectious disease caused by the coronavirus.",
                style: kSubtitleStyle.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, bottom: 8.0, top: 8.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: HomePage()));

                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                    height: 350.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Column(
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            Container(height: 150.0),
                                            Container(
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                  color: Color(0xff07213B)),
                                            ),
                                            Positioned(
                                                top: 50.0,
                                                left: 94.0,
                                                child: Container(
                                                  height: 90.0,
                                                  width: 90.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            45.0),
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 2.0),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/maskedman.jpg',
                                                        ),
                                                        fit: BoxFit.fill),
                                                  ),
                                                ))
                                          ],
                                        ),
                                        SizedBox(height: 20.0),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      'tCOVID needs an active internet connection. Click on the  ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'NotoSerif',
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              WidgetSpan(
                                                  child: Icon(
                                                Icons.mail,
                                                color: Colors.green,
                                              )),
                                              TextSpan(
                                                text:
                                                    '  icon to provide your valuable suggestions.',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'NotoSerif',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ]),
                                          ),
                                        ),
                                        SizedBox(height: 15.0),
                                        FlatButton(
                                            child: Center(
                                              child: Text(
                                                'OKAY',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.teal),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: Colors.transparent)
                                      ],
                                    )));
                          });
                    },
                    color: kPurpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "Get Started",
                      style: kSubtitleStyle.copyWith(
                          color: Colors.white, fontSize: 15.5),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
