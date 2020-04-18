import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_oekaki/components/palette.dart';
import 'package:simple_oekaki/components/paper.dart';
import 'package:simple_oekaki/models/strokes_model.dart';

import '../components/paper.dart';

class PaperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: size.height / 2,
            child: Paper(),
          ),
          Expanded(
            child: Paper(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          strokes.clear();
        },
      ),
    );
  }
}
