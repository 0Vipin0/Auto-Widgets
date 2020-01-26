import 'package:flutter/material.dart';

class VBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Text('Bottom');
      },
    );
  }
}
