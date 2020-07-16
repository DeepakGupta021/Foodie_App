import 'package:flutter/material.dart';
import '../data/CategoryList.dart';
import '../widgets/category_item.dart';
//import '../Models/meal.dart';

class Catergories extends StatelessWidget {
  static final String categoriesRoute="/Categories";
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).accentColor.withOpacity(0.6),
              Theme.of(context).primaryColor.withOpacity(0.4)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: GridView(
          padding: const EdgeInsets.all(20),
          children: catList
              .map(
                (catData) =>
                    CategoryItem(catData.id, catData.name, catData.color),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
    );
  }
}
