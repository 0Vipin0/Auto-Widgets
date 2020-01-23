import '../../styles.dart';
import 'package:flutter/material.dart';

/// The main purpose of this File is just for the purpose of including basic widgets.
class VText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Simple Text Widget",
          style: kMainHeadingText,
        ),
        _simpleTextWidget(),
        _simpleTextWidget2(),
        Text(
          "Using rich Named Constructor",
          style: kMainHeadingText,
        ),
        _richNamedConWidget(),
        Text(
          "Using RichText",
          style: kMainHeadingText,
        ),
        _richTextWidget(),
        Text(
          "Styling the Text",
          style: kMainHeadingText,
        ),
        _styleWidget(),
        _styleWidget2(context)
      ],
    );
  }

  Text _styleWidget2(BuildContext context) {
    return Text(
      'Scale',
      style: DefaultTextStyle.of(context).style.apply(
            fontSizeFactor: 2.0,
            fontSizeDelta: 1,
            decoration: TextDecoration.none,
          ),
    );
  }

  Text _styleWidget() {
    return Text(
      'Decoration',
      style: TextStyle(
        fontWeight: FontWeight.w900,
        decoration: TextDecoration.lineThrough,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }

  RichText _richTextWidget() {
    return RichText(
      text: TextSpan(
        text: 'Level 1',
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: 'Level 2',
            style: TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'Level 3',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Text _richNamedConWidget() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'The quick brown'),
          TextSpan(
              text: 'fox',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              )),
          TextSpan(text: 'jumps over the lazy dog.'),
        ],
      ),
    );
  }

  Text _simpleTextWidget2() {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _simpleTextWidget() {
    return Text(
      "Hello World",
    );
  }
}
