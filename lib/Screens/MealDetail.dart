import 'package:Foodie/Models/meal.dart';
import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../data/CategoryList.dart';

class MealDetail extends StatelessWidget {
  static final mealDetailRoute = "/MealDetail";

  final Function _toggleFav;
  final Function _isFav;
  
  MealDetail(this._isFav,this._toggleFav);


  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArg["id"];

    final Meal mealObj = DUMMY_MEALS.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealObj.title,
          //style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).accentColor.withOpacity(0.6),
              Theme.of(context).primaryColor.withOpacity(0.4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      mealObj.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  child: Column(
                    children: mealObj.ingredients
                        .map(
                          (e) => Column(
                            children: <Widget>[
                              Divider(
                                thickness: 1,
                              ),
                              Text(
                                "${e['ingredient']}",
                                textAlign: TextAlign.center,
                              ),
                              //Divider(),
                              Text(
                                "${e['value']}",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                width: double.infinity,
                padding: EdgeInsets.all(5),
                height: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: Text("${index + 1}"),
                        backgroundColor: Theme.of(context).accentColor,
                      ),
                      title: Text(mealObj.steps[index],
                          style: Theme.of(context).textTheme.bodyText2),
                    ),
                  ),
                  itemCount: mealObj.steps.length,
                ),
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
                onPressed: ()=> _toggleFav(mealObj.id),
                child:Icon(_isFav(mealObj.id)? Icons.star:Icons.star_border,color: Colors.yellowAccent,),
              ),
    );
  }
}
