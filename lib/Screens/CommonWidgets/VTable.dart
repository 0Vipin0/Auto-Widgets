import 'package:flutter/material.dart';

class VTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Table(
          border: TableBorder.all(color: Colors.red.shade200),
          children: [
            TableRow(children: [Text('A'), Text('B'), Text('C'), Text('D')]),
            TableRow(children: [Text('E'), Text('F'), Text('G'), Text('H')]),
            TableRow(children: [Text('I'), Text('J'), Text('K'), Text('L')]),
          ],
        ),
        Table(
          border: TableBorder.all(color: Colors.blue.shade200),
          columnWidths: {
            0: FixedColumnWidth(100),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(2),
            3: FractionColumnWidth(0.2),
          },
          children: [
            TableRow(children: [Text('A'), Text('B'), Text('C'), Text('D')]),
            TableRow(children: [Text('E'), Text('F'), Text('G'), Text('H')]),
            TableRow(children: [Text('I'), Text('J'), Text('K'), Text('L')]),
          ],
        ),
      ],
    );
  }
}

class VerticalAlignmentTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.green.shade200),
      defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
      children: [
        TableRow(children: [
          TextCell('A'),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text('B'),
          ),
          Text('C'),
          Text('D'),
        ]),
        TableRow(children: [Text('E'), Text('F'), Text('G'), Text('H')]),
        TableRow(children: [Text('I'), Text('J'), Text('K'), Text('L')]),
      ],
    );
  }
}
class TextCell extends StatelessWidget {
  TextCell(this.text, {this.height = 50});
  final String text;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height,
      ),
      child: Text(text),
    );
  }
}
