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
      appBar: AppBar1('종점/기점 남은시간 표시 어플'),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              printTime(),
              SizedBox1(20),
              Text2('정류장선택'),
              SizedBox1(20),
              ElevatedButton(
                onPressed: () => navigateToChosunHaeorem(context, stations[0]),
                child: Text1('조선대 해오름관'),
              ),
              SizedBox1(12),
              ElevatedButton(
                onPressed: () => navigateToBeUpadate(context, "tobeupadate"),
                child: Text1('업데이트 예정입니다'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar1(),

    );
  }
}
