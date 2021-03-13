import 'package:flutter/material.dart';

import '../constants.dart';

class FooterOKButton extends StatelessWidget {
  final routeName;
  const FooterOKButton({
    Key key,
    this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            child: Text('Go Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }
}
