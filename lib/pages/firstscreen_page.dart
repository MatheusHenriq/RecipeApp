import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:recipe/pages/loginscreen_page.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with SingleTickerProviderStateMixin{

  AnimationController _animation;
  double _imageGrow = 2;
  Timer _timer;
  Timer _changescreen;


  void initState(){
    super.initState();
    _animation = AnimationController(vsync: this, duration : Duration(seconds : 2));
    _animation.forward(from : 0.1);
    _timer = Timer(Duration(seconds : 2),(){
      _imageGrow = _imageGrow * 3;
    });
    _changescreen = Timer(Duration(seconds : 3 ),(){
      Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));    

    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body :  Container(       
        decoration: BoxDecoration(
          gradient  : LinearGradient(
            begin     : Alignment.topRight,
            end       : Alignment.bottomLeft,
            colors    : [Color(0xff8B4513),Color(0xffA0522D)],
          )
        ),
        child     :  Column(
          
          children: <Widget>[

          SizedBox(height: 60,),

          SizedBox(
              child : ColorizeAnimatedTextKit(
                text : ['Recipes'],
                textStyle: TextStyle(
                    fontSize: 50.0, 
                    fontWeight: FontWeight.w900,
                    fontFamily: "Cormorant Upright"
                ),
                colors : [Colors.green, Colors.blue]
              ),
          ),
          
          
         Expanded(
          child : Center(  
              child : SizedBox(child:AnimatedBuilder(
                animation: _animation, 
                builder: (_,child){
                  return RotationTransition(
                    turns : Tween(begin : 0.0, end : 1.0).animate(_animation),
                    child :  Image(
                      height: 50 * _imageGrow,
                      image: AssetImage('assets/images/scroll.png'),
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

