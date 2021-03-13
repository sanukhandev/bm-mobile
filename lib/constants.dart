import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:baithul1/size_config.dart';

const BASEURL = "http://192.168.1.3/bmgroup-back/index.php/";

final currency = NumberFormat("#,##0.00", "en_US");

const kPrimaryColor = Color(0xFF99BE39);
const kPrimaryLightColor = Color(0xFFA1C538);

const kSuccessColor = Color(0xff5FD0D3);
const kDangerColor = Color(0xffF468B7);
const kWarningColor = Color(0xffFEC85C);
const kInfoColor = Color(0xff8D7AEE);
const kDarkColor = Color(0xFF1F1F1F);

const defaultTextColor = Color(0xFF343A40);

const double kDefaultPadding = 20.0;
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF99BE39), Color(0xFFA1C538)],
);
const kSecondaryColor = Color(0xFF77A13C);
const kTextColor = Color(0xFFB9C39E);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kagIdNullError = "Agreement Id Cannot be Empty";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
