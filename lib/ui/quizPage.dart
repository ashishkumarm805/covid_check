import 'package:covid_check/repo.dart';
import 'package:covid_check/ui/questionPage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:covid_check/utils/json_parser.dart';

class QuizPage extends StatefulWidget {
  final int age;
  final String name;
  QuizPage({Key key, this.age, this.name});
  @override
  _QuizPageState createState() => _QuizPageState(age,name);
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState(age,name);
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Repository repo;
    return Scaffold(
      appBar: AppBar(
        title: Text("Self - Assessment "),
      ),
  
      body: Container(
        child:Stack(
        children: <Widget>[
          FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('resources/ta.json'),
              builder: (context, snapshot) {
                Map mydata = json.decode(snapshot.data.toString());
                if (mydata == null) {
                  return Container(
                    child: Center(
                      child: Text(
                        "Loading",
                      ),
                    ),
                  );
                } else {
                  repo = createNewRepoClass(mydata);
                  return Container(
                    child: Stack(
                    children: <Widget>[
                      QuestionPage(len:repo.questions.length,ctx: context,repo:repo,name:widget.name,age:widget.age),
                    ],),
                  );
                }
              }),
        ],
      ),
    ),);
  }
}
