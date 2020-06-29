import 'package:dhikrapp/screens/backscreen_theme.dart';
import 'package:dhikrapp/screens/frontlayer_screen.dart';
import 'package:dhikrapp/screens/save_screen.dart';
import 'package:dhikrapp/widgets/save_button.dart';
import 'package:flutter/material.dart';
import './items/colors.dart';
import 'package:backdrop/backdrop.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import './items/build_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        primaryColor: MyFavoriteColors.primaryBlue,
        backgroundColor: MyFavoriteColors.primaryYellow,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          title: "My Dhikr",
          home: MyHomePage(),
        );
      },
    );
  }
}

//Variables

double per = 0;
int centerNumber = 0;
int constantNumber = 1;
int number;
String footer = "Please choose";

void sayacDegeriniAzalt() {
  if (centerNumber > 1 && per > 0) {
    centerNumber--;
    per = per - 1 / constantNumber;
  } else if (centerNumber == 1) {
    resetPercent();
  }
}

void sayacDegeriniArttir() {
  if (centerNumber < constantNumber) {
    centerNumber++;
    per += 1 / constantNumber;
  } else {}
}

void resetPercent() {
  per = 0;
  centerNumber = 0;
}

//////////

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Map<String, int> dhikrList = {
      "Ayatul Kursi": 313,
      "YaSin 1": 41,
      "YaSin 2": 123,
      "Kelime-i tevhid": 70000,
      "Vallahü Galibun": 1461,
      "Salat-i Nariye": 4444,
      "Salat-i Fethiye": 1000,
      "Ihlas-i Şerif": 1001,
    };

    List<String> keys = dhikrList.keys.toList();
    List<int> values = dhikrList.values.toList();

    return BackdropScaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Dhikr App"),
        actions: <Widget>[
          Tooltip(
            message: "Theme Settings",
            child: BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            ),
          ),
          Tooltip(
            message: "Save Dhikr",
            child: SaveButton(
              name: footer,
              lastDhikr: centerNumber,
            ),
          ),
        ],
      ),
      backLayer: ChangeThemeBox(),
      frontLayer: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //percentage
          Percentage(per, centerNumber, footer),

          ///list
          buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '${(index + 1)}',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        keys[index],
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      trailing: Text(
                        "${values[index]}",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onTap: () {
                        setState(() {
                          centerNumber = values[index];
                          constantNumber = values[index];
                          per = 1;
                          footer = keys[index];
                        });
                      },
                    ),
                  ],
                ),
                itemCount: keys.length,
              ),
              height * 0.25,
              width * 0.7),

          ///reset button && saved List
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width * 0.25,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                child: FlatButton(
                  highlightColor: Theme.of(context).primaryColor,
                  color: Colors.blueGrey[300],
                  onPressed: () {
                    setState(() {
                      if (constantNumber != 0) {
                        centerNumber = constantNumber;
                        per = 1;
                      } else {
                        per = 0;
                        centerNumber = 0;
                      }
                    });
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(fontSize: width * 0.04),
                  ),
                ),
              ),
              Container(
                width: width * 0.32,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                child: FlatButton(
                  highlightColor: Colors.blueGrey[300],
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SaveScreen(),),);
                  },
                  child: Text(
                    "Saved Dhikrs",
                    style: TextStyle(fontSize: width * 0.04),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      frontLayerBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            tooltip: "Undo",
            heroTag: "undo",
            backgroundColor: Theme.of(context).primaryColor,
            mini: true,
            child: Icon(Icons.undo),
            onPressed: () {
              setState(() {
                sayacDegeriniArttir();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: FloatingActionButton(
              tooltip: "Dhikr",
              heroTag: "subtract",
              backgroundColor: Theme.of(context).primaryColor,
              mini: false,
              child: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  sayacDegeriniAzalt();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
