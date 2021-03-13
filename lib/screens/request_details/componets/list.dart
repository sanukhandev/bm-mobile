import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class AttachmentListBuilder extends StatelessWidget {
  final attach;
  const AttachmentListBuilder({Key key, this.attach}) : super(key: key);

  @override
  Widget build(BuildContext context) => (attach as List)
      .map(
        (req) => ListItems(
          url: req['doc_url'],
        ),
      )
      .toList()
      .toColumn();
}

class ListItems extends StatefulWidget {
  final String url;
  ListItems({Key key, this.url}) : super(key: key);

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    final listItem = ({Widget child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .padding(vertical: 12, left: 12) // margin
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTapDown: (details) => print('tapDown'),
          onTap: () => print('tap tap'),
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    return listItem(
      child: <Widget>[
        Icon(
          Icons.attach_email_outlined,
          color: Colors.black,
        ),
        Text(
          widget.url,
          style: TextStyle(color: Colors.black),
        )
      ].toRow(),
    );
  }
}
