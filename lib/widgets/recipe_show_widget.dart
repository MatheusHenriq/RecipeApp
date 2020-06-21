import 'package:flutter/material.dart';

class RecipeShow extends StatefulWidget {
  final String recipeName;
  final String recipeDescription;

  RecipeShow({ @required this.recipeName,@required this.recipeDescription});

  @override
  _RecipeShowState createState() => _RecipeShowState();
}

class _RecipeShowState extends State<RecipeShow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.all(16),
      child   : ConstrainedBox(
        constraints : BoxConstraints(
          minHeight   : 100,
          maxWidth    : 400,  
        ),
        child       : Material(
          elevation : 14.0,
          borderRadius: BorderRadius.circular(24),
          shadowColor : Colors.grey[400],
          child       : Column(
            children: <Widget>[
              Row(
                mainAxisAlignment : MainAxisAlignment.spaceBetween,
                children          : <Widget>[

                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image(
                      fit   : BoxFit.contain,
                      height: 100,
                      width : 100,
                      image : AssetImage('assets/images/scroll.png')
                    ),
                  ),

                  Expanded(
                    child : Column(
                      mainAxisAlignment : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Recipe Name',
                          style : TextStyle(
                            fontSize: 16,
                            fontFamily: "Cormorant Upright",
                            fontWeight: FontWeight.w800,
                            color     : Colors.brown[400],
                          ),
                        ),

                        Text(
                          widget.recipeName,
                          style : TextStyle(
                            fontSize: 24,
                            fontFamily: "Cormorant Upright",
                            fontWeight: FontWeight.w600,
                            color     : Colors.black,
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),  

              ExpansionTile(
              title   : Text(
                'How to make "${widget.recipeName}" ?',
                style : TextStyle(
                  fontSize: 18,
                  fontFamily: "Cormorant Upright",
                  fontWeight: FontWeight.w400,
                  color     : Colors.blueAccent,
                ),
              ),
              children: <Widget>[
                Container(
                  padding : EdgeInsets.all(16.0),
                  child   : Text(
                    widget.recipeDescription,
                    style : TextStyle(
                      fontSize: 16,
                      fontFamily: "Cormorant Upright",
                      fontWeight: FontWeight.w400,
                      color     : Colors.blueAccent,
                    ),
                  ),
                ),
              ],
              ),
            ],
          ),           
        ),
      )
    );
  }
}