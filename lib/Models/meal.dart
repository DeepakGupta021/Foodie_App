import 'package:flutter/foundation.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard,
}
enum Affordability{
  Affordable,
  Pricy,
  Luxurious,
}
class Meal{
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final List<String> steps;
  final List<Map<String,String>> ingredients;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isGlutenFree;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.categories,
    @required this.steps,
    @required this.ingredients,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isVegan,
    @required this.isLactoseFree,
    @required this.isVegetarian,
    @required this.isGlutenFree,
  });

}