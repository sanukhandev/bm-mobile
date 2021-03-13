import 'package:flutter/material.dart';

class FlatBoxButton extends StatelessWidget {
  const FlatBoxButton({Key key, this.color, this.text}) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: color,
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
