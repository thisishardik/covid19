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
                    },
                    color: kPurpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "Get Started",
                      style: kSubtitleStyle.copyWith(color: Colors.white),
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
