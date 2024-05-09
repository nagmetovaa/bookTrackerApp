import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TitleField extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('Hello'),
        SizedBox(
          width: 270,
        ),
        Icon(Icons.notifications),
        Icon(Icons.settings)
      ],
    );
  }
}