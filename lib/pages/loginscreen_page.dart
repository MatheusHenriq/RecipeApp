import 'package:flutter/material.dart';
import 'package:recipe/widgets/mytextformfield_widget.dart';
import 'package:validators/validators.dart' as validator;//

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _formKey = GlobalKey<FormState>();

  
  Widget build(BuildContext context) {
    return Scaffold(
      body  : Form(
        key: _formKey,
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin     : Alignment.topRight, 
                end       : Alignment.bottomLeft,
                colors    : [Color(0xff8B4513),Color(0xffA0522D)] ,
              ),
            ),
          child : ListView(       
            children          : <Widget>[
              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 200,
                      image : AssetImage('assets/images/scroll.png'),
                    ), 

                    MyTextFormField(
                      text     : 'E-mail',
                      length   : 250,
                      validator: (value){
                        if(value.isEmpty) return 'Insert your e-mail.';
                        if(!validator.isEmail(value)) return 'This e-mail is not valid.';
                      },
                    ),

                    MyTextFormField(
                      text      : 'Password',
                      length    : 16,
                      isPassword: true,
                      validator : (value){
                        if(value.isEmpty) return 'Insert your password.';
                        if(value.length<7) return 'Very short password.';
                        if(value.length>16) return 'Very large password.';
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ), 

                Container(
                  padding : EdgeInsets.only(
                    top   : 0,
                    bottom: 0,
                    right : 50,
                    left  : 50,
                  ),
                  height  : 50,
                  width   : 50 ,
                    child   : RaisedButton(
                      shape     : RoundedRectangleBorder(
                        borderRadius : BorderRadius.circular(24)
                      ) ,
                      onPressed : (){
                        if(_formKey.currentState.validate());
                      },
                        color     : Colors.white,
                        child     : Text(
                          'Sign In',
                          style : TextStyle(
                            fontSize  : 16,
                            fontFamily: "Cormorant Upright",
                            fontWeight: FontWeight.w400,
                            color     : Colors.blue
                          ),
                        ),
                    ),
                ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New Here ?',
                    style: TextStyle(
                      fontSize    : 16,
                      fontFamily  : "Cormorant Upright",
                      fontWeight  : FontWeight.w400,
                      color       : Colors.black
                    ),
                  ),

                  MaterialButton(
                    onPressed : (){},
                    child     : Text(
                     'Create Account',
                      style: TextStyle(
                        fontSize  : 16,
                        fontFamily: "Cormorant Upright",
                        fontWeight: FontWeight.w400,
                        color     : Colors.white,
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}