import 'package:flutter/material.dart';
import 'package:worldtime/pages/Choose_Location.dart';
import 'package:worldtime/pages/Home.dart';
import 'package:worldtime/pages/Loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/' ,
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));


