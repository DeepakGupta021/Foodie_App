import 'package:flutter/material.dart';
//import '../data/CategoryList.dart';
import '../Models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMeal extends StatelessWidget {
  static const route = '/categoryMeal';
  final List<Meal> _selectedMeals;
  CategoryMeal(this._selectedMeals);
  
  // final String title;
  // final String id;

  // CategoryMeal(this.id,this.title);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    

    final List<Meal> inCategoryMeals = _selectedMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            img: inCategoryMeals[index].imageUrl,
            name: inCategoryMeals[index].title,
            duration: inCategoryMeals[index].duration,
            affordability: inCategoryMeals[index].affordability,
            complexity: inCategoryMeals[index].complexity,
            id:inCategoryMeals[index].id,
          );
        },
        itemCount: inCategoryMeals.length,
      ),
    );
  }
}
