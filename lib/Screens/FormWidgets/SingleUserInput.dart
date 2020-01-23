import 'package:flutter/material.dart';

class ReverseText extends StatefulWidget {
  @override
  _ReverseTextState createState() => _ReverseTextState();
}

class _ReverseTextState extends State<ReverseText> {
  final TextEditingController _controller = TextEditingController(
    text: "<input>",
  );
  String _value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
              ),
            ),
            RaisedButton(
              child: Text('Go'),
              onPressed: () {
                this.setState(() {
                  _value = _controller.text;
                });
              },
            ),
          ],
        ),
        Text((_value ?? "").split("").reversed.join()),
      ],
    );
  }
}

class ReverseTextWithListener extends StatefulWidget {
  @override
  _ReverseTextWithListenerState createState() =>
      _ReverseTextWithListenerState();
}

class _ReverseTextWithListenerState extends State<ReverseTextWithListener> {
  TextEditingController _controller;
  String _value;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: "<input>",
    );
    _controller.addListener(_handleTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: _controller,
        ),
        Text((_value ?? "").split("").reversed.join()),
      ],
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChanged);
    super.dispose();
  }

  void _handleTextChanged() {
    this.setState(() {
      this._value = _controller.text;
    });
  }
}

class TextFieldCallbacks extends StatefulWidget {
  @override
  _TextFieldCallbacksState createState() => _TextFieldCallbacksState();
}

class _TextFieldCallbacksState extends State<TextFieldCallbacks> {
  List<String> _logs = List();
  void _log(String value) {
    this.setState(() {
      this._logs.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          onChanged: (text) => _log('changed: $text'),
          onEditingComplete: () => _log('completed'),
          onSubmitted: (text) => _log('submitted: $text'),
        ),
        Text.rich(TextSpan(
          children: this._logs.map((log) => TextSpan(text: '$log\n')).toList(),
        )),
      ],
    );
  }
}
