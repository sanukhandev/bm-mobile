import 'package:baithul1/components/chip.dart';
import 'package:baithul1/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import '../../../constants.dart';
import '../../../http_service.dart';
import 'package:intl/intl.dart';

import 'list.dart';

class RequestDetailsBody extends StatefulWidget {
  final dataId;
  RequestDetailsBody({Key key, this.dataId}) : super(key: key);

  @override
  _RequestDetailsBodyState createState() => _RequestDetailsBodyState();
}

class _RequestDetailsBodyState extends State<RequestDetailsBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;

  var request;
  var attachments;

  @override
  void initState() {
    super.initState();
    getRequestDetails();
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
  }

  getRequestDetails() async {
    await AuthService.getRequestData(widget.dataId).then((rdata) => {
          if (mounted)
            {
              setState(() {
                if (rdata['STATUS'] == 'OK_200') {
                  isLoading = false;
                  request = rdata['request'];
                  attachments = rdata['attachments'];
                }
              })
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
            SafeArea(
              child: <Widget>[
                ChipBuilder(
                  color: kInfoColor,
                  text: '#REQ-' + request['id'],
                ).padding(top: 6),
                Spacer(),
                Text(
                  DateFormat.yMMMMd('en_US')
                      .format(DateTime.parse(request['created_on'])),
                  style: TextStyle(
                    color: Colors.grey[850],
                    fontWeight: FontWeight.bold,
                  ),
                ).padding(
                  bottom: 5,
                )
              ].toRow(),
            ),
            <Widget>[
              Text(
                request['type'] == '1'
                    ? 'Vacating Request'
                    : 'Maintanace Request',
                style: TextStyle(
                    color: Colors.grey[650],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ).padding(top: 10, bottom: 10),
              Spacer(),
              ChipBuilder(
                      color: request['status'] == '1'
                          ? kWarningColor
                          : kSuccessColor,
                      text: request['status'] == '1' ? 'Pending' : 'Processed')
                  .padding(all: 12)
                  .padding(left: 15, right: 10),
            ].toRow(),
            <Widget>[
              Expanded(
                child: Text(
                  request['subject'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ).padding(top: 10, bottom: 10),
              ),
            ].toRow(),
            <Widget>[
              Expanded(
                child: Text(
                  'Note: ' + request['message'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ).padding(top: 10, bottom: 10),
              ),
            ].toRow(),
            (attachments != null)
                ? AttachmentListBuilder(attach: attachments)
                : Center(
                    child: Text('No Attachments'),
                  ),
          ].toColumn().parent(page);
  }
}
