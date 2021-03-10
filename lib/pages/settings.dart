import 'package:firebasedatabase/design/Customtheme.dart';
import 'package:firebasedatabase/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
int co=0;
TextEditingController Itemname=TextEditingController();
TextEditingController itemrate=TextEditingController();

final DBreference=FirebaseDatabase.instance.reference();
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  Future showdialog1(BuildContext context,String message)async{
    return showDialog(context: context,
        child: new AlertDialog(
          title: new Text(message),
          content: Text('Please '
              'Click Show and'
              'Delete the Entire Data'),
          actions: [
            new FlatButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('OK'))
          ],
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: Card(
          color: CustomTheme.of(context).backgroundColor,
          elevation: 16.0,
          child: Container(
            height: MediaQuery.of(context).size.height*0.45,
            width: MediaQuery.of(context).size.width*0.9,
            color: Colors.white60,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  ListTile(
                    title: Center(child: Text('UserDetails')),
                  ),
                  ListTile(
                    subtitle: TextFormField(
                      controller: Itemname,
                      validator: (String val){
                        if(val.isEmpty){
                          return 'Please Enter the Itemname';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.system_update_alt,color: CustomTheme.of(context).accentColor,),
                        filled: true,
                        labelText: 'Itemname',
                        hintText: 'Enter the name of the Item',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: CustomTheme.of(context).accentColor,),
                          borderRadius: BorderRadius.all(Radius.circular(30)),

                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    subtitle: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      validator: (String val){
                        if(val.isEmpty){
                          return 'Please Enter the Itemrate';
                        }
                        return null;
                      },
                      controller: itemrate,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.money,color: CustomTheme.of(context).accentColor,),
                        filled: true,
                        labelText: 'Itemrate',
                        hintText: 'Enter the Rate of the Item',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent,),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: CustomTheme.of(context).accentColor,),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  ListTile(
                    title: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      color: CustomTheme.of(context).accentColor,
                      elevation: 10.0,
                          child: Text('Save',style: GoogleFonts.robotoSlab(fontSize: 20.0,fontWeight: FontWeight.bold,textStyle: TextStyle(color: Colors.black)),),
                          onPressed: (){
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              Scaffold.of(context)
                                  .showSnackBar(SnackBar(content: Text('Your Data is Saved')));
                            }
                            Writedata();
                          },
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Writedata()
  {
    if(co<20)
    {
      if(itemrate.text.isNotEmpty && Itemname.text.isNotEmpty) {
        DBreference.child(Username).push().set({
          'Itemname': Itemname.text,
          'Itemrate': itemrate.text,
        });
        Itemname.clear();
        itemrate.clear();
      }
    }
    else if(co>19)
    {
        showdialog1(context, 'Maximum 10 Items can be Store');
    }
    co++;
  }

}
