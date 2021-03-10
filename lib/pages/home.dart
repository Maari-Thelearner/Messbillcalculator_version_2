import 'package:firebasedatabase/design/Customtheme.dart';
import 'package:firebasedatabase/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

TextEditingController num1 = TextEditingController();
TextEditingController num2 = TextEditingController();
TextEditingController num3 = TextEditingController();
TextEditingController num4 = TextEditingController();
TextEditingController num5 = TextEditingController();
TextEditingController num6 = TextEditingController();
TextEditingController num7 = TextEditingController();
TextEditingController num8 = TextEditingController();
TextEditingController num9 = TextEditingController();
TextEditingController num10 = TextEditingController();
int val;

class Home extends StatefulWidget {
  Home({this.app});
  final FirebaseApp app;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final referenceDatabase = FirebaseDatabase.instance;
  DatabaseReference _movieref;
  @override
  void initState(){
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _movieref = database.reference().child(Username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Container(
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
                                int index) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: CustomTheme.of(context).accentColor,width: 0.60)),

                                ),
                                child: new ListTile(
                                  title: Row(
                                    children: [
                                      Text(
                                        snapshot.value['Itemname']
                                            .toString()
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 40.0,
                                      ),
                                      Text(
                                        "Rate - \u{20B9}${snapshot.value['Itemrate']}",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  subtitle: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.countertops,color: CustomTheme.of(context).accentColor,),
                                      filled: true,
                                      labelText: 'Count',
                                      hintText: '1 ${snapshot.value['Itemname']} is \u{20B9}${snapshot.value['Itemrate']}',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: CustomTheme.of(context).accentColor,),
                                        borderRadius: BorderRadius.all(Radius.circular(30)),

                                      ),
                                    ),
                                    onSubmitted: (value) {
                                      if (index == 0) {
                                        val = int.parse(num1.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      } else if (index == 1) {
                                        val = int.parse(num2.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      } else if (index == 2) {
                                        val = int.parse(num3.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      } else if (index == 3) {
                                        val = int.parse(num4.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      } else if (index == 4) {
                                        val = int.parse(num5.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      } else if (index == 5) {
                                        val = int.parse(num6.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      } else if (index == 6) {
                                        val = int.parse(num7.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      } else if (index == 7) {
                                        val = int.parse(num8.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      } else if (index == 8) {
                                        val = int.parse(num9.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      } else if (index == 9) {
                                        val = int.parse(num10.text) *
                                            int.parse(
                                                snapshot.value['Itemrate']);
                                        Add(val);
                                      }
                                    },
                                    controller: index == 0
                                        ? num1
                                        : index == 1
                                        ? num2
                                        : index == 2
                                        ? num3
                                        : index == 3
                                        ? num4
                                        : index == 4
                                        ? num5
                                        : index == 5
                                        ? num6
                                        : index == 6
                                        ? num7
                                        : index == 7
                                        ? num8
                                        : index == 8
                                        ? num9
                                        : num10,
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: 100.0,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<int> list = new List();
Add(int value) {
  list.add(value);
}

Sum() {
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    sum = sum + list[i];
  }
  return sum;
}

Clear() {
  num1.clear();
  num2.clear();
  num3.clear();
  num4.clear();
  num5.clear();
  num6.clear();
  num7.clear();
  num8.clear();
  num9.clear();
  num10.clear();
  list.clear();
}
