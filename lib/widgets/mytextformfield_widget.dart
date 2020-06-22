import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {

  final String text;
  final Function validator;
  final bool  isPassword ;
  final int length;

  final bool isEmail;

  MyTextFormField({this.text,this.validator,this.isPassword=false,this.length,this.isEmail = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16),
      child  :   TextFormField(
        
        keyboardType: isPassword ? TextInputType.text : TextInputType.emailAddress,
        validator   : validator,
        obscureText : isPassword ? true : false,
        maxLength   : length,
        decoration  : InputDecoration(
          prefixIcon: isPassword ? Icon(Icons.https) : Icon(Icons.email),
          counterText : '',
          hintText    : isPassword ? 'Password' : isEmail ? 'chefs@exemple.com' : "Chef's Name",
          hintStyle   : TextStyle(
            fontSize    : 24,
            fontFamily  : "Cormorant Upright",
            fontWeight  : FontWeight.w400,
            color       : Colors.white,  
          ) ,
          border      : OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0)
          ),

          labelText   : text,
          errorStyle: TextStyle(color:Colors.orange), //change color of text return by form validator
          labelStyle  : TextStyle(
            fontSize    : 24,
            fontFamily  : "Cormorant Upright" ,
            fontWeight  : FontWeight.w400,
            color       : Colors.white 
          ), 
        ),
        style       : TextStyle(
          fontSize    : 24,
          fontFamily  : "Cormorant Upright",
          fontWeight  : FontWeight.w400,
          color       : Colors.white, 
        ),
        
      ),
    );
  }
}