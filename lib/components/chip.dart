import 'package:flutter/material.dart';

class ChipBuilder extends StatelessWidget {
  final text;
  final Color color;
  const ChipBuilder({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
        label: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: color);
  }
}
