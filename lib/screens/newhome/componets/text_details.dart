import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';

class FromToDates extends StatelessWidget {
  const FromToDates({
    Key key,
    this.start,
    this.end,
  }) : super(key: key);
  final String start;
  final String end;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithText(
              text: 'FROM: ' +
                  DateFormat.yMMMMd('en_US').format(DateTime.parse(start))),
          Spacer(),
          TitleWithText(
              text: 'TO: ' +
                  DateFormat.yMMMMd('en_US').format(DateTime.parse(end))),
        ],
      ),
    );
  }
}

class TitleWithText extends StatelessWidget {
  const TitleWithText({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: defaultTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
