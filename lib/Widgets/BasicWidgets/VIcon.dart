import 'package:auto_widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Normal Icon",
          style: kMainHeadingText,
        ),
        _normalIcon(),
        Text("Font Awesome Icon"),
        _fontAwesomeIcon(),
      ],
    );
  }

  Icon _fontAwesomeIcon() {
    return Icon(
        FontAwesomeIcons.angry,
        size: 80,
        color: Colors.blue,
      );
  }

  Icon _normalIcon() {
    return Icon(
        Icons.call,
        size: 100,
        color: Colors.red,
      );
  }
}
