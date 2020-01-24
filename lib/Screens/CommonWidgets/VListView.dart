import 'package:flutter/material.dart';

class VListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Text("ListView 1"),
            Text("ListView 2"),
            Text("ListView 3"),
          ],
        ),
        ListView.builder(
          itemCount: 3,
          itemBuilder: (context, count) {
            return Text("ListView Builder ${count + 1}");
          },
        ),
        ListView.separated(
          itemBuilder: (context, count) {
            return Text("ListView Separated ${count + 1}");
          },
          separatorBuilder: (context, count) {
            return Divider();
          },
          itemCount: 3,
        )
      ],
    );
  }
}
