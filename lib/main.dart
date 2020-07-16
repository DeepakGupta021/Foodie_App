import 'package:flutter/material.dart';
import './Screens/categories.dart';
import './Screens/categoryMeal.dart';
import './Screens/MealDetail.dart';
import './Screens/tabs.dart';
import './Screens/filters.dart';

import './Models/filterValue.dart';
import './Models/meal.dart';

import './data/CategoryList.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FilterValue _choices = FilterValue(
      isGlutenFree: false,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: false);

  void _setChoices(FilterValue inputedValue)
  {
    setState(() {
      _choices=inputedValue;
    });
  }

  List<Meal> get _selectedMeals{
    return DUMMY_MEALS.where((meal) {
      if(_choices.isGlutenFree && !meal.isGlutenFree)
        {return false;}
      if(_choices.isLactoseFree && !meal.isLactoseFree)
        {return false;}
      if(_choices.isVegan && !meal.isVegan)
        {return false;}
      if(_choices.isVegetarian && !meal.isVegetarian)
        {return false;}
        
      return true;
    }).toList();
  } 

  List<Meal> favMeal=[];
  bool _isFav(String id)
  {
    return favMeal.any((meal){
      
      return meal.id==id;
    });
  }

  void _toggleFav(String id)
  {
    var index=favMeal.indexWhere((meal){
      return meal.id==id;
    });

    if(index>=0)
    {
      setState(() {
        favMeal.removeAt(index);
      });
    }
    else
    {
      setState(() {
        favMeal.add(DUMMY_MEALS.firstWhere((meal){
          return meal.id==id;
        }));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Color.fromRGBO(230, 140, 149, 1),
          accentColor: Color.fromRGBO(50, 230, 212, 1),
          canvasColor: Color.fromRGBO(239, 230, 212, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(230, 50, 68, 1),
                height: 1.5,
                fontSize: 20,
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed')),
        ),
        //home: Tabs(),
        routes: {
          "/": (ctx) => Tabs(favMeal),
          CategoryMeal.route: (ctx) => CategoryMeal(_selectedMeals),
          Catergories.categoriesRoute:(ctx)=>Catergories(),
          MealDetail.mealDetailRoute: (ctx) => MealDetail(_isFav,_toggleFav),
          Filters.filtersRoute: (ctx) => Filters(_choices,_setChoices),
        });
  }
}
