import 'dart:async';
import 'package:bustime/functions/navigate.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../TimeTablePage.dart';
import '../functions/time.dart';
import '../functions/widget.dart';

class ChosunHaeorem extends StatefulWidget {
  final String stationId;
  ChosunHaeorem({required this.stationId});

  @override
  State<ChosunHaeorem> createState() => _ChosunHaeoreumState();
}

class _ChosunHaeoreumState extends State<ChosunHaeorem> {
  List<QueryDocumentSnapshot>? docs;
  Timer? _timer;
  String? stationName;

  @override
  void initState() {
    super.initState();
    fetchBuses();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> fetchBuses() async {
    final snapshot = await FirebaseFirestore.instance.collection(widget.stationId).get();
    final allDocs = snapshot.docs;

    final infoDoc = allDocs.firstWhere((doc) => doc.id == 'information');
    final infoData = infoDoc.data() as Map<String, dynamic>;

    setState(() {
      docs = allDocs.where((doc) => doc.id != 'information').toList();
      stationName = infoData['kr_name'] ?? widget.stationId;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (docs == null || stationName == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final isHoliday = isTodayHoliday();

    return Scaffold(
      appBar: AppBar1(stationName!),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              printTime(),
              SizedBox(height: 12),
              ...docs!.map((doc) {
                final d = doc.data() as Map;
                final raw = d[isHoliday ? 'table_holi' : 'table_week'] ?? '';
                final diff = calculateNextBusDiff(raw);

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    child: ListTile(
                      title: Center(child: Text(d['kr_name'] ?? doc.id)),
                      subtitle: Center(
                        child: Text(
                          diff.nextTime != null
                              ? '다음버스: ${diff.nextTime} (남은시간 ${diff.minutes}분 ${diff.seconds}초)'
                              : '오늘 운행 끝',
                        ),
                      ),
                      onTap: () => navigateToTimetable(context, d),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
