import 'package:flutter/material.dart';
import 'package:recipe/widgets/backgroundlayout_widget.dart';
import 'package:recipe/widgets/recipe_show_widget.dart';

class InsideAPP extends StatefulWidget {
  @override
  _InsideAPPState createState() => _InsideAPPState();
}

class _InsideAPPState extends State<InsideAPP> with SingleTickerProviderStateMixin {

  TabController _tabcontroller;

  void initState(){
    super.initState();
    _tabcontroller = TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: BackGroundLayout(child: null),
        title : Row(
          mainAxisAlignment : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children          : <Widget>[

            Icon(Icons.restaurant_menu,color: Colors.black,),

            SizedBox(
              width: 10,
            ),

            Text(
              'Recipe',
              style : TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                fontFamily: "Cormorant Upright",
                color     : Colors.black 
              ),
            ),

           Spacer(flex:2),

            IconButton(
              icon      : Icon(Icons.speaker_notes,size: 26,), 
              onPressed : (){},
              color     : Colors.black,
            ) ,
            
          ],
        )
      ),

      bottomNavigationBar: BottomAppBar(
        child : BackGroundLayout(
          child : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon      : Icon(Icons.home), 
                color     : Colors.black,
                onPressed : (){},
              ),

              IconButton(
                icon      : Icon(Icons.search), 
                onPressed : (){}
              ),

              IconButton(
                icon          : Icon(Icons.star),
                highlightColor: Colors.yellow, 
                color         : Colors.black,
                onPressed     : (){}
              ),

              IconButton(
                icon: Icon(Icons.person), 
                onPressed: (){}
              ),
            ],
          ),
        ),
      ),
      body :  ListView(
        scrollDirection : Axis.vertical,
        children        : <Widget>[
          RecipeShow(
            recipeDescription: 'Preheat oven to 350 degrees F (175 degrees C). Grease and flour a 9x9 inch pan or line a muffin pan with paper liners.Step 2In a medium bowl, cream together the sugar and butter. Beat in the eggs, one at a time, then stir in the vanilla. Combine flour and baking powder, add to the creamed mixture and mix well. Finally stir in the milk until batter is smooth. Pour or spoon batter into the prepared pan.Step 3Bake for 30 to 40 minutes in the preheated oven. For cupcakes, bake 20 to 25 minutes. Cake is done when it springs back to the touch.',
            recipeName: 'Simple White Cake',
          )
        ],
      ),
    );
  }
}