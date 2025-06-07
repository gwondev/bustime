import 'package:flutter/material.dart';
import 'functions/time.dart';
import 'functions/widget.dart';

class TimetablePage extends StatelessWidget {
  final Map data;

  TimetablePage({required this.data});

  @override
  Widget build(BuildContext context) {
    final List<String> week = (data['table_week'] ?? '').toString().split('@');
    final List<String> holi = (data['table_holi'] ?? '').toString().split('@');

    return Scaffold(
      appBar: AppBar1('${data['kr_name'] ?? ''}'),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              printTime(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Row를 가운데로
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 평일 시간표
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('평일 시간표', textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      ...week.map((t) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Chip(label: Text(t)),
                      )),
                    ],
                  ),
                  SizedBox(width: 40),
                  // 휴/공휴일 시간표
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('휴/공휴일 시간표', textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      ...holi.map((t) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Chip(label: Text(t)),
                      )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar1(),
    );
  }
}
