import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final httpHeadersD = {"Content-Type": "application/json"};

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future tenantLogin(data) async {
    print(data);
    final response = await http.post(BASEURL + 'publicapi/logintenant',
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    return json.decode(response.body);
  }

  static Future getAgData() async {
    // final Future<String> token = AuthService().getToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.post(BASEURL + 'publicapi/gettenant',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'token': prefs.getString('token')}));
    return jsonDecode(response.body);
  }

  static Future getRequestData(id) async {
    // final Future<String> token = AuthService().getToken();
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.get(
      BASEURL + 'publicapi/getrequestdetails/' + id,
      headers: {"Content-Type": "application/json"},
    );
    // print(response.body);
    return jsonDecode(response.body);
  }
}
