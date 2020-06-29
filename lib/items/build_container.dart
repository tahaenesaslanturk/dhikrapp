    import 'package:flutter/material.dart';
    
    Widget buildContainer(Widget child, double height, double width) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: height,
        width: width,
        child: child,
      );
    }