import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VDialogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Show SimpleDialog'),
          onPressed: () async {
            String result = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: Text('Choose Color'),
                    children: <Widget>[
                      SimpleDialogOption(
                        child: Text('Red'),
                        onPressed: () {
                          Navigator.pop(context, 'Red');
                        },
                      ),
                      SimpleDialogOption(
                        child: Text('Green'),
                        onPressed: () {
                          Navigator.pop(context, 'Green');
                        },
                      ),
                    ],
                  );
                });
            print(result);
          },
        ),
        RaisedButton(
          child: Text('Show AlertDialog'),
          onPressed: () async {
            bool result = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Delete'),
                  content: Text('Delete this item?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    FlatButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  ],
                );
              },
            );
            print(result);
          },
        ),
        CupertinoButton(
          child: Text('Show Alert Dialog'),
          onPressed: () async {
            bool result = await showCupertinoDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text('Delete'),
                  content: Text('Delete this item?'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('Delete'),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      isDestructiveAction: true,
                    ),
                    CupertinoDialogAction(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  ],
                );
              },
            );
            print(result);
          },
        )
      ],
    );
  }
}
