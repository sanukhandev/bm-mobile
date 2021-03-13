import 'package:baithul1/components/chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import 'package:styled_widget/styled_widget.dart';

class RecipetListBuilder extends StatelessWidget {
  final reciepts;
  const RecipetListBuilder({Key key, this.reciepts}) : super(key: key);

  @override
  Widget build(BuildContext context) => (reciepts as List)
      .map(
        (reciepts) => ListItems(
            id: reciepts['id'],
            status: reciepts['status'],
            amt: currency.format(double.parse(reciepts['amnt'])),
            date: DateFormat.yMMMMd('en_US')
                .format(DateTime.parse(reciepts['dated']))),
      )
      .toList()
      .toColumn();
}

class ListItems extends StatefulWidget {
  final String id;
  final String date;
  final String status;
  final String amt;

  ListItems({Key key, this.id, this.date, this.status, this.amt})
      : super(key: key);

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    final listItem = ({Widget child}) => Styled.widget(child: child)
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
          onTap: () => {},
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget id = ChipBuilder(
      color: kInfoColor,
      text: '#R-' + widget.id,
    ).padding(top: 6);

    final Widget date = Text(
      widget.date,
      style: TextStyle(
        color: Colors.grey[850],
        fontWeight: FontWeight.bold,
      ),
    ).padding(
      bottom: 5,
      top: 5,
    );

    final Widget status = ChipBuilder(
            color: (widget.status == '1') ? kDangerColor : kSuccessColor,
            text: 'AED ' + widget.amt)
        .padding(all: 12)
        .padding(left: 15, right: 10);

    return listItem(
      child: <Widget>[id, date, status]
          .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
    );
  }
}
