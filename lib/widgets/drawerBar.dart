import 'package:flutter/material.dart';
import '../Screens/filters.dart';
class DrawerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildTextTile(String title,IconData icon,Function tapHandler) 
    {
      return ListTile(
            leading: Icon(
              icon,
              size: 26,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: tapHandler,
          );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildTextTile("Meals", Icons.restaurant,() {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          SizedBox(
            height: 20,
          ),
          buildTextTile("Filter Meals!", Icons.settings,() {
            Navigator.of(context).pushReplacementNamed(Filters.filtersRoute);
          }),
          
        ],
      ),
    );
  }
}
