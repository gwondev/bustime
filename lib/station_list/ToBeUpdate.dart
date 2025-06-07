import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../TimeTablePage.dart';
import '../functions/time.dart';
import '../functions/widget.dart';

class ToBeUpdate extends StatefulWidget {
  @override
  _ToBeUpdateState createState() => _ToBeUpdateState();
}

class _ToBeUpdateState extends State<ToBeUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1('To Be Update'),
      body: Center(
        child: Text2('To be Update')
      ),
    );
  }
}
