import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 
  CustomButton({@required this.text,@required this.onPressed});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
    onPressed: onPressed,
    color: Theme.of(context).accentColor,
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
  }
}