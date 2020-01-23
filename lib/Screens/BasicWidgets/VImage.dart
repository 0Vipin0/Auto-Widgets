import 'package:auto_widgets/styles.dart';
import 'package:flutter/material.dart';

class VImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Normal Network Image",
          style: kMainHeadingText,
        ),
        _networkImage(),
        Text(
          "Repeated Images",
          style: kMainHeadingText,
        ),
        _repeatedNetworkImage(),
      ],
    );
  }

  SizedBox _repeatedNetworkImage() {
    return SizedBox(
        width: 400,
        height: 300,
        child: Image.network(
          'https://picsum.photos/300/200',
          alignment: Alignment.topLeft,
          repeat: ImageRepeat.repeat,
        ),
      );
  }

  Image _networkImage() {
    return Image.network(
        'https://picsum.photos/400/300',
        width: 400,
        height: 300,
      );
  }
}
