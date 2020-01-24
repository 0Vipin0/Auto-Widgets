import 'package:flutter/material.dart';

class VListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Title'),
          subtitle: Text('Description'),
          leading: Icon(Icons.shop),
          trailing: Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}

class CheckboxInListTile extends StatefulWidget {
  @override
  _CheckboxInListTileState createState() => _CheckboxInListTileState();
}

class _CheckboxInListTileState extends State<CheckboxInListTile> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text('Checkbox'),
      subtitle: Text('Description'),
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
      secondary: Icon(_value ? Icons.monetization_on : Icons.money_off),
    );
  }
}

enum CustomColor { red, green, blue }
class RadioInListTile extends StatefulWidget {
  @override
  _RadioInListTileState createState() => _RadioInListTileState();
}

class _RadioInListTileState extends State<RadioInListTile> {
  CustomColor _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: CustomColor.values.map((color) {
        return RadioListTile<CustomColor>(
          title: Text(color.toString()),
          value: color,
          groupValue: _selectedColor,
          onChanged: (value) {
            setState(() {
              _selectedColor = value;
            });
          },
        );
      }).toList(),
    );
  }
}

class SwitchInListTile extends StatefulWidget {
  @override
  _SwitchInListTileState createState() => _SwitchInListTileState();
}
class _SwitchInListTileState extends State<SwitchInListTile> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('Switch'),
      subtitle: Text('Description'),
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}