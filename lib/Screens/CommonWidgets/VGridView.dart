import 'package:flutter/material.dart';

class VGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GridView.count(
          crossAxisCount: 3,
          children: List.generate(10, (index) {
            return Text('Fixed Count ${index + 1}');
          }),
        ),
        GridView.extent(
          maxCrossAxisExtent: 250,
          children: List.generate(10, (index) {
            return Text(
              'Max Extent ${index + 1}',
            );
          }),
        ),
        GridView.builder(
          itemCount: 32,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Text('Builder ${index + 1}');
          },
        ),
        GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 4 / 3,
          children: List.generate(10, (index) {
            return Image.network('https://picsum.photos/400/300');
          }),
        ),
        GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            GridTile(
              child: Text('Simple'),
            ),
            GridTile(
              child: Text('Header & Footer'),
              header: GridTileBar(
                title: Text('Header'),
                backgroundColor: Colors.red,
              ),
              footer: GridTileBar(
                title: Text('Footer'),
                subtitle: Text('Description'),
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ],
    );
  }
}
