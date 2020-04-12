import 'package:covid_check/ui/quizPage.dart';
import 'package:covid_check/utils/appTranslations.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _formKey = GlobalKey<FormState>();
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Future navigateToSubPage(context, route) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final nameController = new TextEditingController();
    final ageController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("About You"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: AppTranslations.of(context).text("yourname")),
                  controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: AppTranslations.of(context).text("yourage")),
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  validator: (value) {
                    if (value.isEmpty && isNumeric(value)) {
                      return 'Please enter your age in numbers';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        int age = int.parse(ageController.text);
                        if (age<120 && age > 0) {
                          navigateToSubPage(
                              context,
                              QuizPage(
                                  age: int.parse(ageController.text),
                                  name: nameController.text));
                        }
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
