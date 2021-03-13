import 'package:baithul1/components/my_ok_button_footer.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'componets/main_body.dart';

class RequestDetailsScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(context),
      body: RequestDetailsBody(
        dataId: args['id'],
      ),
      bottomNavigationBar: FooterOKButton(
        routeName: '/home',
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Request Details',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context, true),
      ),
    );
  }
}
