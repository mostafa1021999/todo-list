import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/shared%20pref.dart';

List<String> tags = Save.getdata( key: 'tags')?.cast<String>().toList() ?? [];
List<String> des = Save.getdata( key: 'des')?.cast<String>().toList() ?? [];

List<String> search = [];



void toasts(String mass , Color color) => Fluttertoast.showToast(
    msg: mass,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0
);

void navigate(context , widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget));