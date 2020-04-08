import 'package:covid_check/ui/precaution_page.dart';
import 'package:covid_check/ui/questionPage.dart';
import 'package:covid_check/utils/appTranslations.dart';
import 'package:flutter/material.dart';

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
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    int result = 0;
                    for (int i = 2; i < 9; i++) {
                      result += widget.score[i];
                    }
                    int temp = widget.score[1];
                    int journey = widget.score[9];
                    int severity = widget.score[11];
                    int history = widget.score[10];

                    if (temp == 1 &&
                        (journey == 0 || journey == 1) &&
                        severity == 0 &&
                        history < 2 &&
                        result < 2) {
                      return Text(
                        AppTranslations.of(context).text("low"),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0),
                      );
                    } 
                    if (temp == 2 && (journey == 0 ||
                        journey == 1) &&
                            (severity == 0 || severity == 1) &&
                            history < 2 &&
                            (result >= 2 && result <= 6)) {
                      return Text(
                        AppTranslations.of(context).text("medium"),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0),
                      );
                    }
                    if((temp == 2 || temp == 3) && (journey == 0 ||
                        journey == 1) &&
                            severity > 1&&
                            history < 2 &&
                            result > 6) {
                      return Text(
                        AppTranslations.of(context).text("high"),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0),
                      );
                    }
                        if((temp == 2 || temp == 3) && (journey == 0 ||
                        journey == 1) &&
                            severity > 1&&
                            history >= 2 &&
                            result > 6) {
                      return Text(
                        AppTranslations.of(context).text("high") + AppTranslations.of(context).text("isolation"),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0),
                      );
                    }
                    if((temp == 2 || temp == 3) && (journey == 0 ||
                        journey == 1) &&
                            severity == 1&&
                            history < 2 &&
                            result > 6) {
                      return Text(
                        AppTranslations.of(context).text("medium") + AppTranslations.of(context).text("isolation"),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0),
                      );
                    }
                    if((temp == 2 || temp == 3) && (
                        journey == 2) &&
                            (severity == 1 || severity == 0)&&
                            history < 2 &&
                            result > 2) {
                      return Text(
                        AppTranslations.of(context).text("medium") + AppTranslations.of(context).text("isolation"),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0),
                      );
                    }
                    if((temp == 1) && (
                        journey > 2) &&
                            severity == 1&&
                            history < 2 &&
                            result > 6) {
                      return Text(
                        AppTranslations.of(context).text("high") + AppTranslations.of(context).text("isolation"),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0),
                      );
                    }
                  },
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
