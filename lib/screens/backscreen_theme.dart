import 'package:flutter/material.dart';
import '../items/colors.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class ChangeThemeBox extends StatelessWidget {

  final List<Color> colorList = [
    MyFavoriteColors.primaryAccentBlue,
    MyFavoriteColors.primaryAccentRed,
    MyFavoriteColors.primaryBlue,
    MyFavoriteColors.primaryCream,
    MyFavoriteColors.primaryGreen,
    MyFavoriteColors.primaryOrange,
    MyFavoriteColors.primaryRed,
    // other Colors
    Colors.amber,
    Colors.brown,
    Colors.deepPurple,
    Colors.green,
    Colors.grey,
    Colors.lightBlue,
    Colors.limeAccent,
    Colors.orange,
    Colors.red,
    Colors.teal,
  ];




  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          children: <Widget>[
            Center(child: Container(margin: EdgeInsets.symmetric(vertical: 10),child: RaisedButton.icon(icon: Icon(Icons.brightness_4,),label: Text("Dark Mode"),onPressed: () {
                  DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
            }))),
            Flexible(
              child: GridView.count(
                crossAxisCount: 3,
                children: List<Widget>.generate(
                  17,
                  (index) => GridTile(
                    child: InkWell(
                      child: Card(
                        color: colorList[index],
                      ),
                      onTap: () {
                        DynamicTheme.of(context).setThemeData(ThemeData(
                            primaryColor: Theme.of(context).primaryColor ==
                                    MyFavoriteColors.primaryCream
                                ? colorList[index]
                                : colorList[index]));
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}