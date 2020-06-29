import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {

  double percent;
  String centerText;
  String footerText;
  Color color;
  MyProgressIndicator({this.centerText,this.footerText,this.percent, this.color});

  @override
  Widget build(BuildContext context) {

    

    double width = MediaQuery.of(context).size.width;

    return CircularPercentIndicator(
      radius: width*0.6,
      lineWidth: width*0.06,
      animation: false,
      percent: percent,
      center: Text(
        centerText,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: width*0.12),
      ),
      footer: Text(
        footerText,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize:  width*0.05),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: color,
    );
  }
}
