import 'package:covid_check/ui/precaution_page.dart';
import 'package:covid_check/ui/questionPage.dart';
import 'package:covid_check/utils/appTranslations.dart';
import 'package:flutter/material.dart';
import 'package:covid_check/utils/scoring.dart';

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
                    String xres;
                    int temp = widget.score[1];
                    int journey = widget.score[9];
                    int severity = widget.score[11];
                    int history = widget.score[10];
                    if (temp == 1) {
                      if (result == 0 && severity == 0 && history < 2) {
                        xres = "low";
                      } else if (result == 1 && severity == 1 && history < 2) {
                        xres = "low";
                      } else if (result <= 3 && severity == 1 && journey == 0) {
                        xres = "medium";
                      } else if (result == 0 && severity == 0 && journey > 2) {
                        xres = "medium";
                      }
                    }
                    //temperature is fever
                    else if (temp == 2) {
                      if (result < 3 && severity == 2 && journey == 0) {
                        xres = "medium";
                      } else if (result <= 3 && severity == 1 && journey == 0) {
                        xres = "medium";
                      } else if (result >= 3 && severity == 2 && journey > 2) {
                        xres = "high";
                      }
                    }
                    //temperature is high fever
                    else if (temp == 3) {
                      if (result <= 3 && severity == 1 && journey == 0) {
                        xres = "medium";
                      } else if (result < 3 && severity == 2 && journey == 0) {
                        xres = "medium";
                      } else if (result >= 3 && severity == 2 && journey > 2) {
                        xres = "high";
                      }
                    }
                    switch (xres) {
                      case "low":
                        return Text(
                          AppTranslations.of(context).text("low"),
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 30.0,
                          ),
                        );
                        break;
                      case "high":
                        return Text(
                          AppTranslations.of(context).text("high") +
                              AppTranslations.of(context).text("isolation"),
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 30.0,
                          ),
                        );
                        break;
                      case "medium":
                        return Text(
                          AppTranslations.of(context).text("medium") +
                              AppTranslations.of(context).text("isolation"),
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 30.0,
                          ),
                        );
                        break;
                      default:
                        return Text(
                          AppTranslations.of(context).text("low") +
                              AppTranslations.of(context).text("isolation"),
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 30.0,
                          ),
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
