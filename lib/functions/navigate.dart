import 'dart:async';
import 'package:flutter/material.dart';

import '../station_list/ChosunHaeorem.dart';
import '../station_list/ToBeUpdate.dart';
import '../TimeTablePage.dart';


void navigateToChosunHaeorem(BuildContext c, String id) {
  Navigator.push(c, MaterialPageRoute(builder: (_) => ChosunHaeorem(stationId: id)));
}

void navigateToBeUpadate(BuildContext c, String id) {
  Navigator.push(c, MaterialPageRoute(builder: (_) => ToBeUpdate()));
}

void navigateToTimetable(BuildContext c, Map<dynamic, dynamic> data) {
  Navigator.push(c, MaterialPageRoute(builder: (_) => TimetablePage(data: data),),);
}
