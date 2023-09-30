import 'package:flutter/material.dart';

class DeckList extends StatelessWidget {
  final List<Widget> widgets;

  const DeckList({Key? key, required this.widgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int index) {
        return widgets[index];
      },
    );
  }
}
