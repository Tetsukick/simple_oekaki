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
    final MediaQueryData media = MediaQuery.of(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: (media.size.height - media.padding.top) / 2,
            child: Paper(true),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black),),
            ),
          ),
          Expanded(
            child: Paper(false),
          )
        ],
      ),
    );
  }
}
