import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class RadioGroup extends StatefulWidget {
  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  @override
  Widget build(BuildContext context) {
    String _picked = "Two";
    return RadioButtonGroup(
      orientation: GroupedButtonsOrientation.HORIZONTAL,
      margin: const EdgeInsets.only(left: 12.0),
      onSelected: (String selected) => setState(() {
        _picked = selected;
      }),
      labels: <String>[
        "One",
        "Two",
      ],
      picked: _picked,
      itemBuilder: (Radio rb, Text txt, int i) {
        return Column(
          children: <Widget>[
            Icon(Icons.public),
            rb,
            txt,
          ],
        );
      },
    );
  }
}

class CheckGroup extends StatefulWidget {
  @override
  _CheckGroupState createState() => _CheckGroupState();
}

class _CheckGroupState extends State<CheckGroup> {
  List<String> _checked = ["A", "B"];
  @override
  Widget build(BuildContext context) {
    return CheckboxGroup(
      orientation: GroupedButtonsOrientation.HORIZONTAL,
      margin: const EdgeInsets.only(left: 12.0),
      onSelected: (List selected) => setState((){
        _checked = selected;
      }),
      labels: <String>[
        "A",
        "B",
      ],
      checked: _checked,
      itemBuilder: (Checkbox cb, Text txt, int i){
        return Column(
          children: <Widget>[
            Icon(Icons.polymer),
            cb,
            txt,
          ],
        );
      },
    );
  }
}
