import 'package:flutter/material.dart';

import './categories.dart';
import './favourites.dart';
import '../widgets/drawerBar.dart';
import '../Models/meal.dart';
class Tabs extends StatefulWidget {
  List<Meal> favMeal;
  Tabs(this.favMeal);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Widget> _screens ;
  int _selectedPageIndex = 0;
  
  void pageSelect(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _screens= [Catergories(), Favourites(widget.favMeal)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("foodie"),
      ),
      drawer: DrawerBar(),
      body: _screens[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) => pageSelect(i),
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(
              "Categories",
              style: TextStyle(fontSize: 16),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(
              "Favourites",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
