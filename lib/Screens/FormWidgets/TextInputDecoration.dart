import 'package:flutter/material.dart';

class TextInputDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.elliptical(5, 10)),
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
              gapPadding: 2,
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.monetization_on),
            prefixText: 'Pay ',
            prefixStyle: TextStyle(fontStyle: FontStyle.italic),
            suffixText: '.00',
          ),
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            hintText: 'Email address for validation',
            helperText: 'For receiving validation emails',
            counterText: '10',
          ),
        ),
      ],
    );
  }
}
