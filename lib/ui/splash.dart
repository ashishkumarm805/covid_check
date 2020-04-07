
import 'package:covid_check/ui/personal_page.dart';
import 'package:covid_check/utils/appTranslations.dart';
import 'package:flutter/material.dart';
import 'package:covid_check/utils/lang_selector.dart';
import '../utils/button.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
  }
Future navigateToSubPage(context,route) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 Assessment"),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(AppTranslations.of(context).text("appName"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white,
                        ))),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(AppTranslations.of(context).text("desc"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.white))),
                LanguageSelectorIconButton(),
                 Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(AppTranslations.of(context).text("welcome"),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.white))),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CustomButton(
                text: AppTranslations.of(context).text("next"),
                onPressed: (){
                  navigateToSubPage(context,AboutPage());
                  },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

