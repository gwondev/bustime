import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../TimeTablePage.dart';
import '../functions/time.dart';

class ChosunHaeorem extends StatefulWidget {
  final String stationId;
  ChosunHaeorem({required this.stationId});

  @override
  State<ChosunHaeorem> createState() => _ChosunHaeoreumState();
}

class _ChosunHaeoreumState extends State<ChosunHaeorem> {
  List<QueryDocumentSnapshot>? docs;
  Timer ? _timer;
  @override
  void initState() {
    super.initState();
    fetchBuses(); // ✅ Firestore에서 데이터 불러오기
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {}); // 🔄 1초마다 rebuild해서 남은시간 갱신
    });
  }
  @override
  void dispose() {
    _timer?.cancel(); // 타이머 정리
    super.dispose();
  }

  Future<void> fetchBuses() async {
    final snapshot = await FirebaseFirestore.instance.collection(widget.stationId).get();
    setState(() {
      docs = snapshot.docs.where((doc) => doc.id != 'information').toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (docs == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final isHoliday = isTodayHoliday();

    return Scaffold(
      appBar: AppBar(title: Text('버스 목록')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          printTime(),
          Expanded(
            child: ListView(
              children: docs!.map((doc) {
                final d = doc.data() as Map;
                final raw = d[isHoliday ? 'table_holi' : 'table_week'] ?? '';
                final diff = calculateNextBusDiff(raw);

                return ListTile(
                  title: Text(d['kr_name'] ?? doc.id),
                  subtitle: Text(
                    diff.nextTime != null
                        ? '다음버스: ${diff.nextTime} (남은시간 ${diff.minutes}분 ${diff.seconds}초)'
                        : '오늘 운행 끝',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TimetablePage(data: d),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
