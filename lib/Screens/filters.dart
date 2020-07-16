import 'package:flutter/material.dart';
import '../widgets/drawerBar.dart';
import '../Models/filterValue.dart';

class Filters extends StatefulWidget {
  static final String filtersRoute = "/Filters";
  final FilterValue choosenValues;
  final Function choiceChanger;

  Filters(this.choosenValues, this.choiceChanger);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;
  bool _isGlutenFree = false;

  @override
  initState() {
    _isVegan = widget.choosenValues.isVegan;
    _isVegetarian = widget.choosenValues.isVegetarian;
    _isLactoseFree = widget.choosenValues.isLactoseFree;
    _isGlutenFree = widget.choosenValues.isGlutenFree;

    super.initState();
  }

  Widget _switchListTileBuilder(
      String title, String description, bool value, Function onChangeHandler) {
    return SwitchListTile(
      value: value,
      onChanged: onChangeHandler,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () { widget.choiceChanger(
              FilterValue(
                  isVegetarian: _isVegetarian,
                  isVegan: _isVegan,
                  isGlutenFree: _isGlutenFree,
                  isLactoseFree: _isLactoseFree),
            );
            Navigator.of(context).pushReplacementNamed("/");
            },
          ),
        ],
      ),
      drawer: DrawerBar(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Center(
                child: Text(
              "Choose Your Meal Filters!",
              style: Theme.of(context).textTheme.headline6,
            )),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _switchListTileBuilder("Gluten Free",
                    "All meals will be Gluten free", _isGlutenFree, (val) {
                  setState(() {
                    _isGlutenFree = val;
                  });
                }),
                _switchListTileBuilder("Lactose Free",
                    "All meals will be Lactose free", _isLactoseFree, (val) {
                  setState(() {
                    _isLactoseFree = val;
                  });
                }),
                _switchListTileBuilder("Vegetarian",
                    "All meals will be Lactose free", _isVegetarian, (val) {
                  setState(() {
                    _isVegetarian = val;
                  });
                }),
                _switchListTileBuilder(
                    "Vegan", "All meals will be Vegan", _isVegan, (val) {
                  setState(() {
                    _isVegan = val;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
