import 'dart:async';
import 'package:flutter/material.dart';


Widget Text1(String text){
  return Text(text,  textAlign: TextAlign.center,
    style: TextStyle(color: Colors.black));
}

Widget Text2(String text){
  return Text(text, textAlign: TextAlign.center,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),);
}

Widget SizedBox1(double size){
  return SizedBox(height: size);
}

PreferredSizeWidget AppBar1(String title) {
  return AppBar(title: Text(title), centerTitle: true,);
}

