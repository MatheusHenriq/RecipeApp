import 'package:flutter/material.dart';

class BackGroundLayout extends StatelessWidget {
  
  Widget child;

  BackGroundLayout({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin     : Alignment.topRight, 
          end       : Alignment.bottomLeft,
          colors    : [Color(0xff8B4513),Color(0xffA0522D)] ,
        ),
      ),
      child : child,
    );
  }
}