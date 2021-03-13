import 'package:flutter/material.dart';

import '../size_config.dart';

class CustomPrefixText extends StatelessWidget {
  const CustomPrefixText({
    Key key,
    @required this.prefixText,
  }) : super(key: key);

  final String prefixText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(20),
        0,
        getProportionateScreenWidth(20),
      ),
      child: Text(prefixText,
          textAlign: TextAlign.center,
          style: new TextStyle(fontWeight: FontWeight.bold)
          // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          ),
    );
  }
}
