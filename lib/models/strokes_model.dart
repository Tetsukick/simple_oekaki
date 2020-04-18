import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:simple_oekaki/models/pen_model.dart';

class StrokesModel extends ChangeNotifier {
  List<Stroke> _strokes = [];
  Size screenSize = Size.zero;

  get all => _strokes;

  void add(PenModel pen, Offset offset, Size screenSize) {
    this.screenSize = screenSize / 2;
    if (offset.dy < this.screenSize.height) {
      _strokes.add(Stroke(pen.color)..add(offset));
    } else {
      _strokes.add(Stroke(pen.color)..add(Offset(offset.dx, offset.dy - this.screenSize.height)));
    }
    notifyListeners();
  }

  void update(Offset offset) {
    if (offset.dy < this.screenSize.height) {
      _strokes.last.add(offset);
    } else {
    _strokes.last.add(Offset(offset.dx, offset.dy - this.screenSize.height));
    }
    notifyListeners();
  }

  void clear() {
    _strokes = [];
    notifyListeners();
  }
}

class Stroke {
  final List<Offset> points = [];
  final Color color;

  Stroke(this.color);

  add(Offset offset) {
    points.add(offset);
  }
}
