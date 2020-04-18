import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_oekaki/models/pen_model.dart';
import 'package:simple_oekaki/models/strokes_model.dart';

import 'dart:math' as math;

class Paper extends StatelessWidget {
  final bool isUppeerView;

  Paper(this.isUppeerView);

  @override
  Widget build(BuildContext context) {
    final pen = Provider.of<PenModel>(context);
    final strokes = Provider.of<StrokesModel>(context);
    final Size size = MediaQuery.of(context).size;

    return Transform.rotate(angle: this.isUppeerView ? - math.pi : 0, child: Listener(
      onPointerDown: (details) {
        print('onPointerDown');
        print(details);
        strokes.add(pen, details.position, size);
      },
      onPointerMove: (details) {
        print('onPointerMove');
        print(details);
        strokes.update(details.position);
      },
      onPointerUp: (details) {
        print('onPoiterUp');
        print(details);
        strokes.update(details.position);
      },
      child: Scaffold(
        body: CustomPaint(
          painter: _Painter(strokes),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            strokes.clear();
          },
        ),
      ),
    ),);

  }
}

class _Painter extends CustomPainter {
  final StrokesModel strokes;

  _Painter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    strokes.all.forEach((stroke) {
      final paint = Paint()
        ..color = stroke.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 3;
      canvas.drawPoints(PointMode.polygon, stroke.points, paint);
    });
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return true;
  }
}
