import 'package:flutter/material.dart';
import 'package:recipe/widgets/recipe_show_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          RecipeShow(
            recipeName: 'Simple White Cake', 
            recipeDescription: 'Preheat oven to 350 degrees F (175 degrees C). Grease and flour a 9x9 inch pan or line a muffin pan with paper liners.Step 2In a medium bowl, cream together the sugar and butter. Beat in the eggs, one at a time, then stir in the vanilla. Combine flour and baking powder, add to the creamed mixture and mix well. Finally stir in the milk until batter is smooth. Pour or spoon batter into the prepared pan.Step 3Bake for 30 to 40 minutes in the preheated oven. For cupcakes, bake 20 to 25 minutes. Cake is done when it springs back to the touch.', 
          ),
          RecipeShow(recipeName: 'Sweet Potatoes', recipeDescription: 'SOMETHING HEre'),
        ],
      ),
    );
  }
}