import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'functions/time.dart';
import 'functions/widget.dart';
import 'functions/navigate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: StationSelectorPage());
}

class StationSelectorPage extends StatefulWidget {
  @override
  _StationSelectorPageState createState() => _StationSelectorPageState();
}

class _StationSelectorPageState extends State<StationSelectorPage> {
  final stations = ['chosun_haeoreum'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('종점/기점 남은시간 표시 어플')),
      body: Column(
        children: [
          printTime(),
          Text2('정류장선택'),
          ListTile(
            title: Text('조선대 해오름관'),
            onTap: () => navigateToChosunHaeorem(context, stations[0]),
          ),
        ],
      ),
    );
  }
}
