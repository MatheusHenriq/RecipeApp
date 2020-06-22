import 'package:flutter/material.dart';
import 'package:recipe/models/models.dart';
import 'package:recipe/pages/insideapp/insideapp_page.dart';
import 'package:recipe/widgets/backgroundlayout_widget.dart';
import 'package:recipe/widgets/mytextformfield_widget.dart';
import 'package:validators/validators.dart' as validator;

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  final _formKey = GlobalKey<FormState>();
  String _confimpass;
  Model model = Model();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :  BackGroundLayout(
        child : Form(
          key : _formKey,
          child   : Padding(
            padding : EdgeInsets.all(16.0),
            child :  ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[

                Center(
                  child : Image(
                    image : AssetImage('assets/images/scroll.png'),
                    height: 50,
                    width: 50,
                  ),
                ),

                Container(
                  child :MyTextFormField(
                    text      : 'Your Name',
                    isEmail: false,
                    length    : 150,                 
                    validator : (String value){
                      if(value.isEmpty) return 'Insert your password.';                   
                    return null;
                    },
                  ),
                ),

                Container(
                  child:MyTextFormField(
                    text      :'E-mail',
                    length    :  250,
                    validator : (value){
                      if(value.isEmpty) return 'Insert your e-mail.';
                      if(!validator.isEmail(value)) return 'This e-mail is not valid.';
                      return null;
                    },
                  ),
                ),

                Container(  
                  child :MyTextFormField(
                    text      : 'Password',
                    length    : 16,
                    isPassword: true,
                    validator : (String value){
                      setState(() {
                        _confimpass = value;
                      });
                      if(value.isEmpty) return 'Insert your password.';
                      if(value.length<7) return 'Very short password.';
                      if(value.length>16) return 'Very large password.';
                    return null;
                    },                    
                  ),
                ),
                
                Container(
                  child : MyTextFormField(
                    text      : 'Confirm Password',
                    length    : 16,
                    isPassword: true,
                    validator : (String value){
                      if(value.isEmpty) return 'Insert your password.';
                      else if(value.length<7) return 'Very short password.';
                      else if(value.length>16) return 'Very large password.';
                      else if(_confimpass != null && value != _confimpass ) return 'Passwords not matched';
        
                    return null;
                    },
                  ),
                ),
                
                SizedBox(
                  height : 30,
                ),

                Container(
                  padding : EdgeInsets.only(
                    left : 50,
                    right: 50,
                  ),
                  height: 50,
                  child : RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                    ),
                    textColor: Colors.brown,
                    onPressed:(){
                      if(_formKey.currentState.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InsideAPP()));
                      };
                    },
                    child   : Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize  : 16,
                        fontFamily: "Cormorant Upright" ,
                        fontWeight: FontWeight.w600,
                        color     : Colors.brown[400] 
                      ),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
        )
      ),  
    );
  }
}