import 'package:flutter/material.dart';
import 'package:recipe/widgets/backgroundlayout_widget.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color : Colors.black),
        flexibleSpace: BackGroundLayout(child: null),
        title :Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                fontFamily: "Cormorant Upright",
                color     : Colors.black 
              ),
            ),
        ),
      );
  }
}