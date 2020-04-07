import 'package:covid_check/utils/appTranslations.dart';
import 'package:flutter/material.dart';
import '../ui/lang_selector_page.dart';

class LanguageSelectorIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _languageIconTapped(context);
      },
      child: Text(AppTranslations.of(context).text("langselect")),
    );
  }

  _languageIconTapped(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LanguageSelectorPage(),
      ),
    );
  }
}