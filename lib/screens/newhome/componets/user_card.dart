import 'package:baithul1/components/chip.dart';
import 'package:baithul1/components/flat_box.dart';
import 'package:baithul1/constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class UserCard extends StatelessWidget {
  final String uname;
  final String tid;
  final String agid;
  final String start;
  final String end;
  final String status;

  const UserCard(
      {Key key,
      this.uname,
      this.tid,
      this.agid,
      this.start,
      this.end,
      this.status})
      : super(key: key);

  Widget _buildUserRow() {
    return <Widget>[
      <Widget>[
        Text(
          'Hi' + uname + ',',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).padding(bottom: 5),
        Text(
          'BM Rental Tenant (' + '#T-' + tid + ')',
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Agreement:  #T-' + agid,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).padding(bottom: 5, top: 5),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      new Spacer(),
      <Widget>[
        ChipBuilder(
          color: kDangerColor,
          text: 'Active',
        ),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.end)
    ].toRow();
  }

  Widget _buildUserStats() {
    return <Widget>[
      _buildUserStatsItem(
          DateFormat.yMMMMd('en_US').format(DateTime.parse(start)), 'START ON'),
      _buildUserStatsItem(
          DateFormat.yMMMMd('en_US').format(DateTime.parse(end)), 'END ON'),
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(vertical: 10);
  }

  Widget _buildUserStatsItem(String value, String text) => <Widget>[
        Text(value).fontSize(20).textColor(Colors.white).padding(bottom: 5),
        Text(text).textColor(Colors.white.withOpacity(0.6)).fontSize(12),
      ].toColumn();

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      _buildUserRow(),
      _buildUserStats(),
    ]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(horizontal: 20, vertical: 10)
        .decorated(
            gradient: kPrimaryGradientColor,
            borderRadius: BorderRadius.circular(20))
        .elevation(
          5,
          shadowColor: Color(0xff3977ff),
          borderRadius: BorderRadius.circular(20),
        )
        .height(200)
        .alignment(Alignment.center);
  }
}
