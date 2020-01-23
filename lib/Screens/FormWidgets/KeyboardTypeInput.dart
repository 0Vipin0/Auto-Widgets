import 'package:flutter/material.dart';

class KeyboardInputType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.phone,
        ),
        TextField(
          keyboardType: TextInputType.numberWithOptions(
            signed: true,
            decimal: true,
          ),
        ),
        TextField(
          textInputAction: TextInputAction.search,
          keyboardAppearance: Brightness.dark,
        ),
      ],
    );
  }
}
