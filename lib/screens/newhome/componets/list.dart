import 'package:baithul1/components/chip.dart';
import 'package:baithul1/constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class Settings extends StatelessWidget {
  final req;

  const Settings({Key key, this.req}) : super(key: key);
  @override
  Widget build(BuildContext context) => (req as List)
      .map(
        (req) => SettingsItem(
          req['status'] == '1' ? 'Pending' : 'Processed',
          req['status'] == '1' ? kDangerColor : kSuccessColor,
          req['id'],
          DateFormat.yMMMMd('en_US').format(DateTime.parse(req['created_on'])),
          (req['type'] == '1' ? 'Vacating' : 'Maintanance') + ' Request',
        ),
      )
      .toList()
      .toColumn();
}

class SettingsItem extends StatefulWidget {
  SettingsItem(
    this.status,
    this.iconBgColor,
    this.title,
    this.description,
    this.text,
  );

  final String status;
  final Color iconBgColor;
  final String title;
  final String description;
  final String text;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final settingsItem = ({Widget child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25) // clip ripple
        .borderRadius(all: 25, animate: true)
        .elevation(
          pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: Color(0x30000000),
        ) // shadow borderRadius
        .constrained(height: 80)
        .padding(vertical: 12) // margin
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTapDown: (details) => print('tapDown'),
          onTap: () => Navigator.pushNamed(context, '/rdetails',
              arguments: {'id': widget.title}),
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget status =
        ChipBuilder(color: widget.iconBgColor, text: widget.status)
            .padding(all: 12)
            .padding(left: 15, right: 10);

    final Widget title = ChipBuilder(
      color: kInfoColor,
      text: '#REQ-' + widget.title,
    ).padding(top: 6);

    final Widget text = Text(
      widget.text,
      style: TextStyle(
        color: Colors.grey[850],
        fontWeight: FontWeight.bold,
      ),
    ).padding(
      bottom: 5,
      top: 25,
    );

    final Widget description = Text(
      widget.description,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ).padding(left: 25);

    return settingsItem(
      child: <Widget>[
        <Widget>[title, description].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        <Widget>[text].toColumn(),
        Spacer(),
        <Widget>[status].toColumn(),
      ].toRow(),
    );
  }
}
