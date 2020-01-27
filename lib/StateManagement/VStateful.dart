import 'package:flutter/material.dart';

class SelectColor extends StatefulWidget {
  @override
  _SelectColorState createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  final List<String> _colors = ['Red', 'Green', 'Blue'];
  String _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DropdownButton(
          value: _selectedColor,
          items: _colors.map((String color) {
            return DropdownMenuItem(
              value: color,
              child: Text(color),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedColor = value;
            });
          },
        ),
        Text('Selected: ${_selectedColor ?? ""}'),
      ],
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CounterButton(() {
          setState(() {
            count++;
          });
        }),
        CounterText(count),
      ],
    );
  }
}

class CounterText extends StatelessWidget {
  CounterText(this.count);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text('Value: ${count ?? ""}');
  }
}

class CounterButton extends StatelessWidget {
  CounterButton(this.onPressed);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('+'),
      onPressed: onPressed,
    );
  }
}
