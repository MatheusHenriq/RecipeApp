import 'package:flutter/material.dart'; // always import this to your script works
import 'dart:async'; //to use Timer
import 'package:animated_text_kit/animated_text_kit.dart'; // to use animatedtext, like ColorizeAnimatedTextKit, for more informations: https://pub.dev/packages/animated_text_kit
import 'package:recipe/pages/loginscreen_page.dart'; // import this  to put in Navigator, to switch pages 

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with SingleTickerProviderStateMixin{

  AnimationController _animation; //required on RotationTranition
  double _imageGrow = 2; //this double will work to make our image grow when time goes by,
  Timer _timer; // both Timer will help me to do some action when time goes by
  Timer _changescreen; 


  void initState(){
    super.initState();
    _animation = AnimationController(vsync: this, duration : Duration(seconds : 2));

    _animation.forward(from : 0.0); 

    _timer = Timer(Duration(seconds : 2),(){
      _imageGrow = _imageGrow * 3;  // use here to increase it
    });

    _changescreen = Timer(Duration(seconds : 3 ),(){
      Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));    // it allow us to navigate between pages, 

    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body :  Container(        
        decoration: BoxDecoration(  
          gradient  : LinearGradient( //here come the back ground color for entire screen, 
            begin     : Alignment.topRight, 
            end       : Alignment.bottomLeft,
            colors    : [Color(0xff8B4513),Color(0xffA0522D)],  //it can contain more colors
          )
        ),
        child     :  Column(  //use this to put things on the screen follow columns scruture
          
          children: <Widget>[ //it will allow you to put a log of widgets follow columns structure

          SizedBox(height: 60,), // use this to set the space between two widget's, 

          SizedBox(
              child : ColorizeAnimatedTextKit(  //  
                text : ['Recipes'], //here goes the text that will be on the screen
                textStyle: TextStyle( //here you can personalize how your text will look like
                    fontSize: 50.0, 
                    fontWeight: FontWeight.w900,
                    fontFamily: "Cormorant Upright"
                ),
                colors : [Colors.green, Colors.blue]
              ),
          ),
          
          
         Expanded( //don't use expanded in ListView(), expanded gets all the space of the widget father
          child : Center(  // use this widget to put whats inside in center
              child : SizedBox(
                child :  AnimatedBuilder( //use this to use some animations 
                animation : _animation, //parameter that is required by default
                builder   : (_,child){  //parameter that is required by default and it will be called every time that animation change his value 
                  return RotationTransition( // this will make the image rotate, but for that you didn't expect
                    turns   : Tween(begin : 0.0, end : 1.0).animate(_animation),
                    child   :  Image(
                      height  : 50 * _imageGrow, //here we will make the image gets bigger when time goes by
                      image   : AssetImage('assets/images/scroll.png'), //pass the image, but there are a lot of another methods that can be called to do this, you can see more in flutter documentation
                    )
                  );
                },
              ),)
            ))



          ],
        ),     
      )
    );
  }
}

