import 'package:flutter/cupertino.dart';

class VActionSheets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('Show Action Sheet'),
      onPressed: () async {
        String result = await showCupertinoModalPopup<String>(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              title: Text('What to do'),
              message: Text('Please select an action'),
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: Text('Duplicate'),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context, 'duplicate');
                  },
                ),
                CupertinoActionSheetAction(
                  child: Text('Move'),
                  onPressed: () {
                    Navigator.pop(context, 'move');
                  },
                ),
                CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  child: Text('Delete'),
                  onPressed: () {
                    Navigator.pop(context, 'delete');
                  },
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        );
        print(result);
      },
    );
  }
}
