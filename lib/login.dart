import 'package:clip_shadow/clip_shadow.dart';
import 'package:firebasedatabase/pageheader.dart';
import 'package:firebasedatabase/pages/home.dart';
import 'package:firebasedatabase/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'design/Customtheme.dart';
import 'design/Mytheme.dart';
import 'design/customappbar.dart';
String Username;
TextEditingController Usernamecon = new TextEditingController();
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: ClipShadow(
          boxShadow: [
            BoxShadow(color: CustomTheme.of(context).accentColor,blurRadius: 10,spreadRadius: 10,
              offset: Offset(0.0,1.0)
          )],
          clipper: CustomAppBar(),
          child: Container(
            color: CustomTheme.of(context).primaryColor,
            child: Center(
              child: Text('Register',style: GoogleFonts.robotoSlab(fontSize: 30.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.white),),
            ),
          ),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 16.0,
          color: CustomTheme.of(context).backgroundColor,
          child: Container(
            height: MediaQuery.of(context).size.height*0.30,
            width: MediaQuery.of(context).size.width*0.9,
            color: Colors.white60,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  ListTile(
                    title: Center(child: Text('User Details',style: GoogleFonts.robotoSlab(fontSize: 25.0,color: Colors.black),)),
                  ),
                  ListTile(
                    subtitle: TextFormField(
                      validator: (String val){
                        if(val.isEmpty){
                          return 'Please Enter your name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.verified_user,color: CustomTheme.of(context).accentColor,),
                        filled: true,
                        labelText: 'Username',
                        hintText: 'Enter the your name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: CustomTheme.of(context).accentColor,),
                          borderRadius: BorderRadius.all(Radius.circular(30)),

                        ),
                      ),
                      controller: Usernamecon,
                    ),
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          color: Colors.green,
                          elevation: 8.0,
                          child: Text('BreakFirst',style: GoogleFonts.robotoSlab(color: Colors.white),),
                          onPressed: (){
                            if (_formKey.currentState.validate()) {
                              Username='${Usernamecon.text} Breakfirst';
                              i=1;
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Pageheader();
                              }));
                            }
                          },
                        ),
                        MaterialButton(
                          color: Colors.green,
                          elevation: 8.0,
                          child: Text('Lunch',style: GoogleFonts.robotoSlab(color: Colors.white),),
                          onPressed: (){
                            if (_formKey.currentState.validate()) {
                              Username='${Usernamecon.text} Lunch';
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Pageheader();
                              }));
                            }
                          },
                        ),
                        MaterialButton(
                          color: Colors.green,
                          elevation: 8.0,
                          child: Text('Dinner',style: GoogleFonts.robotoSlab(color: Colors.white),),
                          onPressed: (){
                            if (_formKey.currentState.validate()) {
                              Username='${Usernamecon.text} Dinner';
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Pageheader();
                              }));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}