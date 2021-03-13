import 'package:baithul1/components/loader.dart';
import 'package:baithul1/screens/recipts/components/recipt_data_table.dart';
import 'package:flutter/material.dart';

import 'package:styled_widget/styled_widget.dart';
import '../../../http_service.dart';

class MainBody extends StatefulWidget {
  MainBody({Key key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  var recipts;

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

  @override
  Widget build(BuildContext context) {
    final page = ({Widget child}) => Styled.widget(child: child)
        .padding(vertical: 30, horizontal: 20)
        .constrained(minHeight: MediaQuery.of(context).size.height - (2 * 30))
        .scrollable();
    return isLoading
        ? SquareLoader()
        : <Widget>[
            (recipts.length > 0 || recipts != null || recipts)
                ? RecipetListBuilder(
                    reciepts: recipts,
                  )
                : Center(
                    child: Text('No Recipts Avilable'),
                  )
          ].toColumn().parent(page);
  }

  getAgDetails() async {
    await AuthService.getAgData().then((rdata) {
      if (mounted) {
        setState(() {
          if (rdata['STATUS'] == 'OK_200') {
            isLoading = false;
            recipts = rdata['recipts'];
          }
        });
      }
    });
  }
}
