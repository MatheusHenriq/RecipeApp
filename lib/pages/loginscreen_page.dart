import 'package:flutter/material.dart';
import 'package:recipe/pages/createaccount_page.dart';
import 'package:recipe/pages/insideapp/insideapp_page.dart';
import 'package:recipe/widgets/backgroundlayout_widget.dart';
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
    return WillPopScope(
      onWillPop: (){
        Future.value(false);
      },
      child :  Scaffold(
          body  : Form(
            key: _formKey,
            child: BackGroundLayout(
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
                            return null;
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

                            return null;
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => InsideAPP()));
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
                        onPressed : (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => CreateAccount()));
                        },
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
        ),
    );
  }
}