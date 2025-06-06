import 'dart:async';
import 'package:flutter/material.dart';


class TimeDiff {
  final String? nextTime;
  final int? minutes;
  final int? seconds;

  TimeDiff({this.nextTime, this.minutes, this.seconds});
}

bool isTodayHoliday() {
  final now = DateTime.now();
  return now.weekday == DateTime.saturday || now.weekday == DateTime.sunday;
}

String getNowString() {
  final now = DateTime.now();
  return '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} '
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} ${now.second.toString().padLeft(2, '0')}';
}

TimeDiff calculateNextBusDiff(String raw) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final list = raw.split('@');

  for (var t in list) {
    if (t.trim().isEmpty) continue;
    var p = t.split(':');
    var dt = DateTime(today.year, today.month, today.day, int.parse(p[0]), int.parse(p[1]));
    var diff = dt.difference(now);
    if (diff.inSeconds > 0) {
      return TimeDiff(
        nextTime: t, minutes: diff.inMinutes, seconds: diff.inSeconds % 60,
      );
    }
  }
  return TimeDiff();
}

class printTime extends StatefulWidget {
  const printTime({super.key});

  @override
  State<printTime> createState() => _printTimeState();
}

class _printTimeState extends State<printTime> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {}); // 1초마다 다시 그림
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final label = (now.weekday == DateTime.saturday || now.weekday == DateTime.sunday)
        ? '휴일'
        : '평일';

    final nowStr =
        '${now.year}년 ${now.month}월 ${now.day}일 ${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.second.toString().padLeft(2, '0')}초';
    return Padding(
      padding: EdgeInsets.all(12),
      child: Text('현재시간 $nowStr ($label)', style: TextStyle(fontSize: 16)),
    );
  }
}