import 'package:covid_check/ui/precaution_page.dart';
import 'package:covid_check/ui/questionPage.dart';
import 'package:covid_check/utils/appTranslations.dart';
import 'package:flutter/material.dart';
import 'package:condition/condition.dart';

import '../repo.dart';

class ResPage extends StatefulWidget {
  final List<int> score;
  final int age;
  final String name;
  final Repository repo;
  ResPage({Key key, this.score, this.age, this.name, this.repo});
  @override
  _ResPageState createState() => _ResPageState(score, age, name, repo);
}

class _ResPageState extends State<ResPage> {
  _ResPageState(score, age, name, repo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "${widget.name}" + AppTranslations.of(context).text("report"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30.0),
                ),
              ),
              Center(
                child: Conditioned(
                  cases: [
                    
                  ],
                  defaultBuilder: () => Text('not defined'),
                  
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text(AppTranslations.of(context).text("next")),
                  onPressed: () {
                    navigateToSubPage(
                        context, PrecautionPage(repo: widget.repo));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
