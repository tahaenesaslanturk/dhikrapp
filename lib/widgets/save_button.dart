import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  static Map<String, int> dhikrMap = {};
  List dhikrKeys = dhikrMap.keys.toList();
  List dhikrValues = dhikrMap.values.toList();

  String name;
  int lastDhikr;

  SaveButton({this.lastDhikr, this.name});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.save),
      onPressed: (){
        dhikrMap.addAll({name:lastDhikr});
        print(dhikrMap);
      },
    );
  }
}
