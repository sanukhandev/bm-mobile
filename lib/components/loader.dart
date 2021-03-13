import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:baithul1/constants.dart';

class SquareLoader extends StatelessWidget {
  final size;
  SquareLoader({this.size});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GFLoader(
        type: GFLoaderType.ios,
        loaderColorOne: kPrimaryColor,
        loaderColorTwo: kSecondaryColor,
        loaderColorThree: kPrimaryLightColor,
        size: size ?? 70,
      ),
    );
  }
}
