import 'package:flutter/material.dart';
import 'package:dhikrapp/items/build_container.dart';
import 'package:dhikrapp/widgets/save_button.dart';

class SaveScreen extends StatefulWidget {

  double perc;
  int centerN;
  int constN;
  String foot;
  SaveScreen({this.centerN,this.constN,this.foot,this.perc});

  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Dhikrs"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        'S${(index + 1)}',
                        style:
                            TextStyle(color: Theme.of(context).backgroundColor),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      SaveButton().dhikrKeys[index],
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    trailing: Text(
                      "${SaveButton().dhikrValues[index]}",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text("Press long to delete"),
                   onLongPress: () {
                     setState(() {
                       SaveButton.dhikrMap.remove(SaveButton().dhikrKeys[index]);
                     });
                   },
                  ),
                ],
              ),
              itemCount: SaveButton().dhikrValues.length,
            ),height,width
          ),
    );
  }
}
