import 'package:covid_check/repo.dart';
import 'package:covid_check/utils/appTranslations.dart';
import 'package:flutter/material.dart';
import 'result_page.dart';

Future navigateToSubPage(context, route) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

class QuestionPage extends StatefulWidget {
  final Repository repo;
  final int len;
  final BuildContext ctx;
  final int age;
  final String name;
  QuestionPage({Key key, this.len, this.repo, this.ctx, this.age, this.name})
      : super(key: key);
  @override
  _QuestionPageState createState() =>
      _QuestionPageState(len, repo, ctx, age, name);
}

class _QuestionPageState extends State<QuestionPage> {
  int _index = 0;
  int _score = 0;
  List<bool> inputs = new List<bool>();
  List<int> scores = new List<int>();
  _QuestionPageState(len, repo, ctx, age, name);
  @override
  void initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < widget.repo.questions[0].answers.length; i++) {
        inputs.add(false);
      }
    });
  }

  void itemChange(bool val, int index) {
    setState(() {
      if (_index != 10) {
        if (!inputs.contains(true)) {
          if (inputs[index] != true) {
            inputs[index] = val;
            _score += widget.repo.questions[_index].scores[index];
            scores.add(_score);
            print(scores.length);
          }
        }
      }else{
        if (inputs[index] != true) {
            inputs[index] = val;
            _score += widget.repo.questions[_index].scores[index];
            
          }
      }
    });
  }

  @override
  Widget build(ctx) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 300.0,
      margin: EdgeInsets.fromLTRB(50.0, 20.0, 20.0, 20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.indigoAccent,
        child: Scrollbar(
          child: Stack(fit: StackFit.expand, children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 30, 50),
              child: Text(
                textLocalizer(context, widget.repo.questions[_index].question),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 400.0,
                  child: Scrollbar(
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(30, 100, 20, 20),
                      itemCount: widget.repo.questions[_index].answers.length,
                      itemBuilder: (context, i) {
                        return new CheckboxListTile(
                            title: Text(
                              textLocalizer(context,
                                  widget.repo.questions[_index].answers[i]),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                            value: inputs[i],
                            onChanged: (val) {
                              itemChange(val, i);
                            });
                      },
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text(AppTranslations.of(context).text("next")),
                  onPressed: incrementIndex,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void incrementIndex() {
    setState(() {
      if(_index == 10){
        scores.add(_score);
        print(scores.length);
      }
      if (_index < widget.len - 1) {
        inputs.clear();
        if(!scores[_index].isNaN){
        _index = _index + 1;
        if (_index < widget.len) {
          for (int i = 0;
              i < widget.repo.questions[_index].answers.length;
              i++) {
            inputs.add(false);
          }
        }
      }
      }
     else {
        navigateToSubPage(
            context,
            ResPage(
                score: scores,
                age: widget.age,
                name: widget.name,
                repo: widget.repo));
      }
    });
  }
}

String textLocalizer(context, String key) {
  String x = AppTranslations.of(context).text(key);
  return x;
}
