import 'package:firebasedatabase/pages/settings.dart';
import 'package:firebasedatabase/pages/show.dart';
import 'package:flutter/material.dart';
import 'cloud_store/home.dart';
import 'design/Customtheme.dart';
import 'design/Mytheme.dart';
import 'login.dart';
var semail;
 void main()  {
   runApp(
       CustomTheme(
       initialThemeKey: MyThemeKeys.LIGHT,
       child:MyApp()
   )
   );
 }
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'MessBillCalculator',
       theme: CustomTheme.of(context),
       home:  Home(),
       routes: {
         '/settings' : (context) => Settings(),
         '/show' : (context) => Show(),
       },
     );
   }
 }
