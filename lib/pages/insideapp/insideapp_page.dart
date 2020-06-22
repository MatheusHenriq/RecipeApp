import 'package:flutter/material.dart';
import 'package:recipe/pages/insideapp/notification_page_insideapp.dart';
import 'package:recipe/pages/insideapp/favorites_page_insideapp.dart';
import 'package:recipe/pages/insideapp/home_page_insideapp.dart';
import 'package:recipe/pages/insideapp/profile_page_insideapp.dart';
import 'package:recipe/pages/insideapp/search_page_insideapp.dart';
import 'package:recipe/widgets/backgroundlayout_widget.dart';


class InsideAPP extends StatefulWidget {
  @override
  _InsideAPPState createState() => _InsideAPPState();
}

class _InsideAPPState extends State<InsideAPP> {

  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home(),
    Search(),
    Favorites(),
    Profile()
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(  
        automaticallyImplyLeading : false,
        flexibleSpace             : BackGroundLayout(child: null),           
                
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
              onPressed : (){
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder       : (context,animation,secondaryAnimation) => Notifications(),
                  transitionsBuilder: (context,animation,secondaryAnimation,child){
                    var begin = Offset(0.8,1.0);
                    var end   = Offset.zero;
                    var curve = Curves.fastOutSlowIn;
                    var tween = Tween(begin : begin, end : end);
                    var curvedAnimation = CurvedAnimation(
                      parent : animation,
                      curve : curve
                    );
                    return SlideTransition(
                      position: tween.animate(curvedAnimation),
                      child : child,
                    );
                  } 
                ));
              },
              color     : Colors.black,
            ) ,
            
          ],
        )
      ),

      body : _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme : IconThemeData(color : Colors.grey),
        selectedIconTheme   : IconThemeData(color : Color(0xffA0522D)),
        selectedItemColor   : Colors.black,
        onTap: changeScreen,
        backgroundColor: Colors.brown,
        currentIndex: _currentIndex,
        items: [

          BottomNavigationBarItem(
            icon  : Icon(Icons.home,),
            title : Text(
              'HOME',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: "Cormorant Upright",
              ),
            ),
            
          ),

          BottomNavigationBarItem(
            icon  : Icon(Icons.search,),
            title : Text(
              'SEARCH',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: "Cormorant Upright",
              ),
            ),
          ),

          BottomNavigationBarItem(
            icon  : Icon(Icons.star,),
            title : Text(
              'FAVORITES',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: "Cormorant Upright",
              ),
            ),
          ),

          BottomNavigationBarItem(
            icon  : Icon(Icons.person,),
            title : Text(
              'PROFILE',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: "Cormorant Upright",
              ),
            ),
          ),

        ],
      ),

    );
  }
  void changeScreen(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}