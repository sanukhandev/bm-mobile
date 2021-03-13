import 'package:flutter/material.dart';

import '../constants.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key key, this.being, this.amt, this.dated, this.rid, this.status})
      : super(key: key);

  final String being;
  final String amt;
  final String rid;
  final String status;
  final String dated;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 150,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: CardContainerWidget(
            being: being, amt: amt, dated: dated, rid: rid, status: status),
      ),
    );
  }
}

class CardContainerWidget extends StatelessWidget {
  const CardContainerWidget(
      {Key key, this.being, this.amt, this.dated, this.rid, this.status})
      : super(key: key);
  final String being;
  final String amt;
  final String rid;
  final String status;
  final String dated;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Stack(children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          FlatBoxButton(
                            color: kInfoColor,
                            text: '#R-' + rid,
                          ),
                          Spacer(),
                          FlatBoxButton(
                            color: kSuccessColor,
                            text: 'AED ' + amt,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          TitleWithText(text: being),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        )
      ]),
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
                  fontWeight: FontWeight.bold, color: defaultTextColor),
            ),
          ),
        ],
      ),
    );
  }
}

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
