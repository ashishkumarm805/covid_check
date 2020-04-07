import 'package:covid_check/utils/appTranslations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../repo.dart';
class PrecautionPage extends StatelessWidget {
  final Repository repo;
  PrecautionPage({Key key,this.repo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(textLocalizer(context, 'precautions5'))),
      ),
        body:Container(
      child:ListView.builder(
        itemCount: repo.precautions.length,
          itemBuilder: (context,index){
        return ListTile(
          title: Text(textLocalizer(context, repo.precautions[index])),
          leading: Icon(Icons.check_circle,color: Colors.green,),
        );
      })
    ));
  }
  String textLocalizer(context, String key) {
    String x = AppTranslations.of(context).text(key);
    return x;
  }
}
