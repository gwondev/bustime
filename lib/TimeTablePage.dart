import 'package:flutter/material.dart';
import 'functions/time.dart';

class TimetablePage extends StatelessWidget {
  final Map data;

  TimetablePage({required this.data});

  @override
  Widget build(BuildContext context) {
    final List<String> week = (data['table_week'] ?? '').toString().split('@');
    final List<String> holi = (data['table_holi'] ?? '').toString().split('@');

    final List<Widget> weekChips = week.map<Widget>((t) => Chip(label: Text(t))).toList();
    final List<Widget> holiChips = holi.map<Widget>((t) => Chip(label: Text(t))).toList();

    return Scaffold(
      appBar: AppBar(title: Text('${data['kr_name'] ?? ''}')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          printTime(),
          Text('평일 시간표'),
          Wrap(spacing: 10, children: weekChips),
          SizedBox(height: 20),
          Text('공휴일 시간표'),
          Wrap(spacing: 10, children: holiChips),
        ],
      ),
    );
  }
}
