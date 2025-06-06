import 'dart:async';
import 'package:flutter/material.dart';

import '../station_list/ChosunHaeorem.dart';
import '../TimeTablePage.dart';

void navigateToChosunHaeorem(BuildContext c, String id) {
  Navigator.push(c, MaterialPageRoute(builder: (_) => ChosunHaeorem(stationId: id)));
}
