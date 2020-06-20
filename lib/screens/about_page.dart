import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:covid19tracker/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'SFProText',
        primaryColor: kDarkPrimaryColor,
        canvasColor: kDarkPrimaryColor,
        backgroundColor: kDarkSecondaryColor,
        accentColor: kAccentColor,
        iconTheme: ThemeData.dark().iconTheme.copyWith(
              color: kLightSecondaryColor,
            ),
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'SFProText',
              bodyColor: kLightSecondaryColor,
              displayColor: kLightSecondaryColor,
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage('assets/images/sample-profile-male.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Hardik Srivastava',
                style: kTitleTextStyle,
              ),
              SizedBox(height: 20),
              Text(
                'Flutter Developer',
                style: kCaptionTextStyle,
              ),
              SizedBox(height: 20),
              Text(
                'technical.hardik29@gmail.com',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: 20),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Theme.of(context).accentColor,
                ),
                child: Center(
                  child: Text(
                    'Upgrade to PRO',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
