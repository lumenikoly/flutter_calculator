import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'calc_model.dart';
import 'package:provider/provider.dart';

class OutputField extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<CalcModel>(
      builder: (context, fiel, child) {
        return SingleChildScrollView(
          controller: _scrollController,
          dragStartBehavior: DragStartBehavior.down,
          child: SelectableText(
            '${fiel.outputValue}',
            style: TextStyle(fontSize: 25, color: Colors.white),
            textAlign: TextAlign.right,
            maxLines: 1,
          ),
        );
      },
    );
  }
}
