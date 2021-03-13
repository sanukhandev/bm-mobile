import 'package:baithul1/components/loader.dart';
import 'package:baithul1/screens/newhome/componets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../http_service.dart';
import 'action_row.dart';
import 'list.dart';

class NewMainBody extends StatefulWidget {
  NewMainBody({Key key}) : super(key: key);

  @override
  _NewMainBodyState createState() => _NewMainBodyState();
}

class _NewMainBodyState extends State<NewMainBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var agreementData;
  var tenant;
  var recipts;
  var mrequest;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getAgDetails();
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
  }

  getAgDetails() async {
    await AuthService.getAgData().then((rdata) {
      if (mounted) {
        setState(() {
          if (rdata['STATUS'] == 'OK_200') {
            isLoading = false;
            agreementData = rdata['agreement'];
            tenant = rdata['tenant'];
            recipts = rdata['recipts'];
            mrequest = rdata['mrequest'];
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final page = ({Widget child}) => Styled.widget(child: child)
        .padding(vertical: 30, horizontal: 20)
        .constrained(minHeight: MediaQuery.of(context).size.height - (2 * 30))
        .scrollable();

    return isLoading
        ? SquareLoader()
        : <Widget>[
            UserCard(
              uname: tenant['first_name'] + ' ' + tenant['last_name'],
              tid: tenant['id'],
              agid: agreementData['id'],
              start: agreementData['lease_start'],
              end: agreementData['lease_end'],
              status: agreementData['status'],
            ),
            ActionsRow(),
            (mrequest != null)
                ? Settings(req: mrequest)
                : Center(
                    child: Text('No Pending Request'),
                  ),
          ].toColumn().parent(page);
  }
}
