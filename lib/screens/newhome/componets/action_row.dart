import 'package:baithul1/constants.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ActionsRow extends StatelessWidget {
  Widget _buildActionItem(String name, IconData icon, Color color) {
    final Widget actionIcon = Icon(icon, size: 20, color: color)
        .alignment(Alignment.center)
        .ripple()
        .constrained(width: 50, height: 50)
        .backgroundColor(Color(0xfff6f5f8))
        .clipOval()
        .padding(bottom: 5);

    final Widget actionText = Text(
      name,
      style: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 12,
      ),
    );

    return <Widget>[
      actionIcon,
      actionText,
    ].toColumn().padding(vertical: 20);
  }

  @override
  Widget build(BuildContext context) => <Widget>[
        _buildActionItem('Recipet', Icons.payment_outlined, kPrimaryColor),
        _buildActionItem('Payments', Icons.card_giftcard, kDangerColor),
        _buildActionItem('Rent', Icons.attach_money_outlined, kInfoColor),
        _buildActionItem('Bills', Icons.book_online_outlined, kWarningColor),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
}
