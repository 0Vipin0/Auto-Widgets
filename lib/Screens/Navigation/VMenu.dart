import 'package:flutter/material.dart';

class VMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Show Menu'),
          onPressed: () async {
            String result = await showMenu<String>(
              context: context,
              position: RelativeRect.fromLTRB(0, 0, 0, 0),
              items: [
                PopupMenuItem(
                  value: 'red',
                  child: Text('Red'),
                ),
                PopupMenuDivider(),
                CheckedPopupMenuItem(
                  value: 'green',
                  checked: true,
                  child: Text('Green'),
                )
              ],
              initialValue: 'green',
            );
            print(result);
          },
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: 'red',
                child: Text('Red'),
              ),
              PopupMenuDivider(),
              CheckedPopupMenuItem(
                value: 'green',
                checked: true,
                child: Text('Green'),
              )
            ];
          },
          initialValue: 'green',
          child: Text('Select color'),
          onSelected: (String value) {
            print(value);
          },
          onCanceled: () {
            print('no selections');
          },
        )
      ],
    );
  }
}
