import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Customtheme.dart';
import 'Mytheme.dart';
import 'customappbar.dart';

class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: CustomTheme.of(context).accentColor,
                    backgroundImage: NetworkImage('https://cdn2.iconfinder.com/data/icons/mobile-web-app-vol-4-1/32/Bill_Note_pay_cash_payment_billing_payment-512.png'),
                  ),
                  Text('Aboutus ',style: GoogleFonts.robotoSlab(fontSize: 30.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.white),),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 16.0,
          color: Colors.transparent,
          child: ListView(
            children: [
              ListTile(
                title: Text('Themes:'),
                subtitle: RaisedButton(
                  color: CustomTheme.of(context).accentColor,
                  onPressed: () {
                    _changeTheme(context, MyThemeKeys.LIGHT);
                  },
                  child: Text("Light",style: TextStyle(color: Colors.black),),
                ),
              ),
              ListTile(
                subtitle: RaisedButton(
                  color: CustomTheme.of(context).accentColor,
                  onPressed: () {
                    _changeTheme(context, MyThemeKeys.DARK);
                  },
                  child: Text("Dark",style: TextStyle(color: Colors.black),),
                ),
              ),
              ListTile(
                subtitle: RaisedButton(
                  color: CustomTheme.of(context).accentColor,
                  onPressed: () {
                    _changeTheme(context, MyThemeKeys.DARKER);
                  },
                  child: Text("Darker",style: TextStyle(color: Colors.black),),
                ),
              ),
              ListTile(
                trailing: RaisedButton(
                  color: CustomTheme.of(context).accentColor,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Go Back',style: GoogleFonts.robotoSlab(color:Colors.black),),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ListTile(title: Center(child: Text('AboutUS',style: GoogleFonts.robotoSlab(color: Colors.white),),),),
              ListTile(
                leading: Text('Name :',style: TextStyle(color: Colors.white),),
                title: Text('Marimuthu',style: TextStyle(color: Colors.white),),
                subtitle: Text('Developer of this App',style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Text('App\ndeveloped\nlanguage :',style: TextStyle(color: Colors.white),),
                title: Text('Flutter',style: TextStyle(color: Colors.white),),
                subtitle: Text('Mobile Application building dart language',style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Text('App version:',style: TextStyle(color: Colors.white),),
                title: Text('Mess_Bill v2.0',style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Text('Contact Us :',style: TextStyle(color: Colors.white),),
                title: Text('Mail us : '
                    'bs.mari100@gmail.com',style: TextStyle(color: Colors.white),),
                ),
              SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
}
