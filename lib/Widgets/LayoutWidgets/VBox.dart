import 'dart:math';

import 'package:auto_widgets/styles.dart';
import 'package:flutter/material.dart';

class VBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Using Different Contraint Boxes",
          style: kMainHeadingText,
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: Text('SizedBox'),
        ),
        SizedBox.shrink(
          child: Image.network('https://picsum.photos/50'),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 50,
            minHeight: 50,
          ),
          child: Text('ConstrainedBox'),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 200,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
            ),
            child: Image.network('https://picsum.photos/300'),
          ),
        ),
        Text(
          "Using Unconstrained Box",
          style: kMainHeadingText,
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: UnconstrainedBox(
            constrainedAxis: Axis.horizontal,
            child: Image.network('https://picsum.photos/200/300'),
          ),
        ),
        Text(
          "Using the Overflow Box",
          style: kMainHeadingText,
        ),

        /// Only if the Overflow Box param are null, then the parent widget is used, otherwise it is ignored.
        /// It is generally used when the parent widget constraint is ignored.
        SizedBox(
          width: 100,
          height: 100,
          child: OverflowBox(
            minWidth: 200,
            minHeight: 200,
            maxWidth: 200,
            maxHeight: 200,
            child: Image.network('https://picsum.photos/300'),
          ),
        ),
        Text(
          "Using SizedOVerflow Box",
          style: kMainHeadingText,
        ),

        /// You want a widget to have a size and allow child widget to overflow.
        ConstrainedBox(
          constraints: BoxConstraints.loose(Size(100, 100)),
          child: SizedOverflowBox(
            size: Size(50, 50),
            child: Image.network('https://picsum.photos/400'),
          ),
        ),
        Text(
          "Using the LimitedBox",
          style: kMainHeadingText,
        ),

        /// You have a widget that normally matches its parent’s size, but you want it
        /// to be used in other places where size constraints are required.
        LimitedBox(
          maxHeight: 100,
          child: Image.network('https://picsum.photos/400'),
        ),
        Text(
          "Using the Fitted Box",
          style: kMainHeadingText,
        ),
        FitPage(),
        Text(
          "Using the Rotated Box",
          style: kMainHeadingText,
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Hello World',
            textScaleFactor: 2,
          ),
        ),
        Text(
          "Using the Aspect Ration",
          style: kMainHeadingText,
        ),
        ConstrainedBox(
          constraints: BoxConstraints.loose(Size(200, 200)),
          child: AspectRatio(
            aspectRatio: 4.0 / 3.0,
            child: Image.network('https://picsum.photos/400/300'),
          ),
        ),
        Text(
          "Transformation on Widgets",
          style: kMainHeadingText,
        ),
        Transform.rotate(
          angle: pi / 4.0,
          origin: Offset(10, 10),
          child: Text('Hello World'),
        ),
        Transform.translate(
          offset: Offset(50, 50),
          child: Text('Hello World'),
        ),
        Text(
          "Using the Container to control the Layout",
          style: kMainHeadingText,
        ),

        /// Structure of the Container
        /// Transform (transform)
        /// - Padding (margin)
        /// - ConstrainedBox (constraints, width, height)
        /// - DecoratedBox (foregroundDecoration)
        /// - DecoratedBox (decoration, color)
        /// - Padding (padding, decoration)
        /// - Align (alignment)
        /// - child
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(16),
          color: Colors.red.shade100,
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/100'),
            ),
          ),
          width: 300,
          height: 300,
          constraints: BoxConstraints.loose(Size(400, 400)),
          margin: EdgeInsets.all(32),
          transform: Matrix4.rotationZ(0.1),
          child: Text(
            'Hello World',
            textScaleFactor: 3,
          ),
        ),
        Text(
          "Using the Flexible and Expanded",
          style: kMainHeadingText,
        ),
        LimitedBox(
          maxHeight: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Image.network('https://picsum.photos/50'),
              ),
              Image.network('https://picsum.photos/40'),
              Expanded(
                child: Image.network('https://picsum.photos/50'),
              ),
              Expanded(
                flex: 2,
                child: Image.network('https://picsum.photos/50'),
              ),
            ],
          ),
        ),
        Text(
          "Using the Wrap",
          style: kMainHeadingText,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 5,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: List.generate(
            10,
            (index) =>
                Image.network('https://picsum.photos/${50 + index * 10}'),
          ),
        ),
        Text(
          "Using Custom Single Child Layout",
          style: kMainHeadingText,
        ),
        CustomSingleChildLayout(
          delegate: FixedPositionLayoutDelegate(),
          child: Image.network('https://picsum.photos/100'),
        ),
        Text(
          "Using Custom Multi Child Layout",
          style: kMainHeadingText,
        ),
        CustomMultiChildLayout(
          delegate: GrowingSizeLayoutDelegate(),
          children: List.generate(
            6,
            (index) => LayoutId(
              id: index,
              child: DecoratedBox(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.network(
                      'https://dummyimage.com/${50 + index * 10}'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GrowingSizeLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    int index = 0;
    Size childSize = layoutChild(index, BoxConstraints.loose(size));
    Offset offset = Offset.zero;
    positionChild(index, offset);
    index++;
    while (hasChild(index)) {
      double sizeFactor = 1.0 + index * 0.1;
      double offsetFactor = index * 10.0;
      childSize = layoutChild(
          index,
          BoxConstraints.tight(Size(
              childSize.width * sizeFactor, childSize.height * sizeFactor)));
      offset = offset.translate(offsetFactor, offsetFactor);
      positionChild(index, offset);
      index++;
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }

  @override
  Size getSize(BoxConstraints constraints) =>
      constraints.constrain(Size(400, 400));
}

class FixedPositionLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    return false;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return constraints.constrain(Size(300, 300));
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(width: 300, height: 300);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(50, 50);
  }
}

class FitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit'),
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.spaceAround,
          children: <Widget>[
            ImageBox(fit: BoxFit.fill),
            ImageBox(fit: BoxFit.contain),
            ImageBox(fit: BoxFit.cover),
            ImageBox(fit: BoxFit.fitWidth),
            ImageBox(fit: BoxFit.fitHeight),
            ImageBox(fit: BoxFit.none),
            ImageBox(fit: BoxFit.scaleDown),
          ],
        ),
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    Key key,
    this.boxWidth = 150,
    this.boxHeight = 170,
    this.imageWidth = 200,
    this.fit,
  });
  final double boxWidth;
  final double boxHeight;
  final double imageWidth;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: SizedBox(
        width: boxWidth,
        height: boxHeight,
        child: FittedBox(
          fit: fit,
          child: SizedBox(
            width: imageWidth,
            height: imageWidth,
            child: Image.network('https://dummyimage.com/${imageWidth.toInt()}'
                '&text=${fit.toString().substring(7)}'),
          ),
        ),
      ),
    );
  }
}
