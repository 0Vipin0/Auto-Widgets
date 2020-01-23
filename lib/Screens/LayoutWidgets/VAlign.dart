import 'package:flutter/material.dart';

class VAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Text("TopLeft"),
        ),
      ),
    );
  }
}
