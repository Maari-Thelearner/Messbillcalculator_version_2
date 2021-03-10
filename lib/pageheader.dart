import 'package:firebasedatabase/design/aboutus.dart';
import 'package:firebasedatabase/pages/home.dart';
import 'package:firebasedatabase/pages/settings.dart';
import 'package:firebasedatabase/pages/show.dart';
import 'package:flutter/material.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'design/Customtheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'design/customappbar.dart';
import 'login.dart';
int count=1;
int i=1;
class Pageheader extends StatefulWidget {
  @override
  _PageheaderState createState() => _PageheaderState();
}

class _PageheaderState extends State<Pageheader> {
  Future showdialog(BuildContext context, String message, int total) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: Center(child: new Text(message,style: GoogleFonts.robotoSlab(fontSize: 25.0,color: CustomTheme.of(context).accentColor),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Amount:',style: GoogleFonts.robotoSlab(fontSize: 20.0,fontWeight: FontWeight.bold),),
              Text(total.toString(),style: GoogleFonts.robotoSlab(fontSize: 40.0,fontWeight: FontWeight.bold),),
            ],
          ),
          actions: [new FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('OK',style: GoogleFonts.robotoSlab(fontSize: 20.0,color: CustomTheme.of(context).accentColor),))],
        ));
  }
  final Home _home = Home();
  final Settings _settings = Settings();
  final Show _show=Show();
  Widget _temp=new Home();
  Widget _per(int hal){
    switch(hal){
      case 0:
        return _show;
        break;
      case 1:
        return _home;
        break;
      case 2:
        return _settings;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: ClipShadow(
          boxShadow: [BoxShadow(color: CustomTheme.of(context).accentColor,blurRadius: 10,spreadRadius: 10,
              offset: Offset(0.0,1.0)
          )],
          clipper: CustomAppBar(),
          child: Container(
            color: CustomTheme.of(context).primaryColor,
            child: Center(
              child:  i==1? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(Username,style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10.0,),
                      Text('MessBillCalculator',style: TextStyle(color: Colors.white,fontSize: 23.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                      Text('Simply your Calculation..',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white60),),

                    ],
                  ),

                ],
              ) :
              i==0 ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.create_new_folder_outlined,size: 25.0,color: Colors.white,),
                      SizedBox(width: 10.0,),
                      Text('${Username}\'s Database',style: GoogleFonts.robotoSlab(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.0))),
                    ],
                  ),
                ],
              ) :
              GestureDetector(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Aboutus();
                    }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Settings',style: GoogleFonts.robotoSlab(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.0)),),
                    Icon(Icons.settings,color: Colors.white,size: 40.0,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: _temp,
      ),
      floatingActionButton: i==1 ? Container(
        margin: EdgeInsets.only(bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () {
                Clear();
              },
              child: Text(
                'C',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            SizedBox(
              height: 70.0,
              width: 70.0,
              child: FloatingActionButton(
                heroTag: 'btn2',
                onPressed: () {
                  showdialog(context, "BILL", Sum());
                },
                child: Icon(
                  Icons.request_page,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
      ) : null,
      bottomNavigationBar: CurvedNavigationBar(
        color: CustomTheme.of(context).primaryColor,
        backgroundColor: CustomTheme.of(context).canvasColor,
        buttonBackgroundColor: CustomTheme.of(context).accentColor,
        height: 50,
        items: [
          Icon(Icons.create,size: 20,color: Colors.black),
          Icon(Icons.home_outlined,size: 20,color:  Colors.black,),
          Icon(Icons.system_update_alt,size: 20,color:  Colors.black),
        ],
        index: 1,
        animationDuration: Duration(
          milliseconds: 200,
        ),
        animationCurve: Curves.bounceInOut,
        onTap: (int index){
          if(index==0)
            {
              i=index;
            }
          else if(index==1)
            {
              i=index;
            }
          else if(index==2)
            {
              i=index;
            }
          if(index==0 || index==2)
            {
              count++;
            }
          setState(() {
            _temp=_per(index);
          });
        },
      ),
    );
  }
}
