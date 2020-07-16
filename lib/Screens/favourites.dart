import 'package:Foodie/Models/meal.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favMeal;
  Favourites(this.favMeal);
  @override
  Widget build(BuildContext context) {
    return favMeal.length==0?Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(child: Text("No Fav's Added Go add some!!!")),

    ):Scaffold(
      
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            img: favMeal[index].imageUrl,
            name: favMeal[index].title,
            duration: favMeal[index].duration,
            affordability: favMeal[index].affordability,
            complexity: favMeal[index].complexity,
            id:favMeal[index].id,
          );
        },
        itemCount: favMeal.length,
      ),
    );
  }
}