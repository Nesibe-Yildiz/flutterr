 import 'package:guncel_studio/kok_ekran.dart';
import 'mezun_login.dart';
import 'package:flutter/material.dart';
 void main() {
   runApp(MaterialApp(
     title: "flutter dersleri",
     onUnknownRoute: (RouteSettings settings) =>
         MaterialPageRoute(builder: (context) => kokEkran()),
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.teal,

     ),

   ));
 }
