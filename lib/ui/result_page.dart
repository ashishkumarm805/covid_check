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
                  "${widget.name}"+ AppTranslations.of(context).text("report"),
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
                    for(int i=2;i<9;i++){
                      result += widget.score[i] ;
                    }

                    // return Text(
                    //   "${result}",
                    //   style: TextStyle(
                    //       color: Colors.green,
                    //       fontWeight: FontWeight.w900,
                    //       fontSize: 40.0),
                    // );
                    if (widget.score[1] <= 2 && result >= 2 && result <=8 && (widget.score[9] >= 2 && widget.score[10] < 4 && widget.score[11] <= 2 ) ) {
                      return Text(
                        AppTranslations.of(context).text("medium"),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0),
                      );
                    } else if (result >= 9 && (widget.score[9] >= 3 && widget.score[10] > 2 && widget.score[11] > 2 )) {
                      return Text(
                        AppTranslations.of(context).text("high"),
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0),
                      );
                    } else {
                      return Text(
                        AppTranslations.of(context).text("low"),
                        style: TextStyle(
                            color: Colors.red,
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
