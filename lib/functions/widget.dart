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

Widget BottomAppBar1() {
  return BottomAppBar(
    child: SizedBox(
      height: 50, // 적절한 높이 (예: 50~60)
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text1('조선대학교 컴퓨터공학과 이성권'),
          Text1('Last Commit : 20250608 0439'),
        ],
      ),
    ),
  );
}

