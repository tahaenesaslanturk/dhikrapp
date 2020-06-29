import 'package:flutter/material.dart';
import 'package:dhikrapp/widgets/progress_indicator.dart';

class Percentage extends StatefulWidget {
  int sayac = 7;
  double percent;
  String footer;

  Percentage(this.percent, this.sayac, this.footer);

  @override
  _PercentageState createState() => _PercentageState();
}

class _PercentageState extends State<Percentage> {
  @override
  Widget build(BuildContext context) {
    return 
        Container(
          child: Center(
              child: MyProgressIndicator(
            centerText: "${widget.sayac}",
            footerText: "${widget.footer}",
            percent: widget.percent,
            color: Theme.of(context).primaryColor,
          )),
          margin: EdgeInsets.symmetric(vertical: 15),
        );
  }
}
