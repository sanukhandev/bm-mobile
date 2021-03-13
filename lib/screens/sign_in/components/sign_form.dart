import 'package:baithul1/components/custom_prefix_text.dart';
import 'package:baithul1/components/form_error.dart';
import 'package:baithul1/helper/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baithul1/components/loader.dart';

import '../../../http_service.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String agid;
  String phone;
  bool remember = false;
  bool isLoading = false;

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildAgreementIDFeild(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFeild(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          !isLoading
              ? DefaultButton(
                  text: "Log In",
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      _formKey.currentState.save();
                      Map<String, dynamic> body = {
                        'id': this.agid,
                        'contact': this.phone
                      };
                      await AuthService.tenantLogin(body).then((rdata) async {
                        print(rdata['token']);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('token', rdata['token']);
                        final snackBar = SnackBar(
                          content: Text('Login Successful redirecting now'),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                        KeyboardUtil.hideKeyboard(context);
                        Navigator.pushNamed(context, '/home');
                      });
                    }
                  },
                )
              : SquareLoader(),
        ],
      ),
    );
  }

  TextFormField buildAgreementIDFeild() {
    return TextFormField(
        obscureText: false,
        keyboardType: TextInputType.number,
        onSaved: (newValue) => agid = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kagIdNullError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kagIdNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Agreement Id #",
          hintText: "Enter Agreement Id",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: CustomPrefixText(prefixText: '#T -'),
        ));
  }

  TextFormField buildPhoneNumberFeild() {
    return TextFormField(
        obscureText: false,
        keyboardType: TextInputType.number,
        onSaved: (newValue) => phone = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPhoneNumberNullError);
          } else if (value.length >= 9) {
            removeError(error: kPhoneNumberNullError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPhoneNumberNullError);
            return "";
          } else if (value.length < 9) {
            addError(error: kPhoneNumberNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Associated Phone #",
          hintText: "Enter Associated Phone Number",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: CustomPrefixText(prefixText: '+971-'),
        ));
  }
}
