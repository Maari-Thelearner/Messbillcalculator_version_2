import 'package:firebasedatabase/design/Customtheme.dart';
import 'package:firebasedatabase/login.dart';
import 'package:firebasedatabase/pageheader.dart';
import 'package:firebasedatabase/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:async';
import 'dart:io' show Platform;

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<int> rate=new List();
List item=new List();
class Show extends StatefulWidget {
  Show({this.app});
  final FirebaseApp app;
  @override
  _ShowState createState() => _ShowState();
}
class _ShowState extends State<Show> {
  final referenceDatabase=FirebaseDatabase.instance;
  DatabaseReference _movieref;
  @override
  void initState(){
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _movieref = database.reference().child(Username);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ref=referenceDatabase.reference();
    return new SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Flexible(
                    child: new FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: _movieref,
                      itemBuilder: (BuildContext context,
                          DataSnapshot snapshot,
                          Animation<double> animation,
                          int index){
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.of(context).accentColor,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: new ListTile(
                            title: Row(
                              children: [
                                Text(snapshot.value['Itemname'].toString().toUpperCase(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                                SizedBox(width: 20.0,),
                               Text("Rate - \u{20B9}${snapshot.value['Itemrate']}",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            trailing: IconButton(icon: Icon(Icons.delete,color: Colors.red,),
                              onPressed: (){

                                _movieref.child(snapshot.key).remove();
                              },
                            ),
                          ),
                        );

                      }
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.all(10.0),
                        elevation: 10.0,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Login();
                          }));
                        },child: Text('Register',
                        style:
                        GoogleFonts.robotoSlab(textStyle: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold)
                        ),
                      ),
                      color: Colors.green,
                      ),
                      SizedBox(width: 10.0,),
                      MaterialButton(
                        padding: EdgeInsets.all(10.0),
                        elevation: 10.0,
                        color: Colors.red,
                        onPressed: () {
                          co=0;
                          referenceDatabase.reference().child(Username).remove();
                        },child: Text('Delete all Data',
                        style:
                        GoogleFonts.robotoSlab(textStyle: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold)
                        ),
                      ),),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Center(
                    child: Text('Register button is used to create a new Database for you !'
                    ,style:
                      GoogleFonts.robotoSlab()
                      ),
                    ),
                  SizedBox(height: 100.0,),
                ],
              ),
            ),

          ],
        ),
      );
  }
}
