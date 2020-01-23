import 'package:auto_widgets/styles.dart';
import 'package:flutter/material.dart';

class VIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Icon Button", style: kMainHeadingText,),
        IconButton(
          icon: Icon(Icons.map),
          iconSize: 50,
          tooltip: 'Map',
          onPressed: () => {},
        ),
        RaisedButton.icon(
          icon: Icon(Icons.save),
          label: Text('Save'),
          onPressed: () => [],
        )
      ],
    );
  }
}
