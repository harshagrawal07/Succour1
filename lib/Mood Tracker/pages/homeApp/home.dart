import 'package:flutter/material.dart';
import 'package:succour/Mood Tracker/databasesqf.dart';
import 'package:succour/Mood Tracker/pages/history.dart';
import 'package:succour/Mood Tracker/pages/analytics.dart';
import 'package:succour/Mood Tracker/pages/homePage.dart';
import 'package:succour/Mood%20Tracker/pages/settings.dart';

class MoodTracker extends StatefulWidget {
  MoodTracker({Key key}) : super(key: key);
  @override
  _MoodTrackerState createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {

  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> moodList = [];
  Future moodsFuture;

  @override
  void initState() {
    super.initState();
    moodsFuture = getMoods();
  }

  getMoods() async {
    //print("peepo");
    final _moodsData = await DBProvider.db.getMood();
    return _moodsData;
  }

  refresh() {
    setState(() {
      _currentIndex = 2;
    });
  }

  Widget build(BuildContext context) {
    List<Widget> tabs = [
      HomePage(
        refresh: refresh,
      ),
      AnalyticsPage(),
      HistoryPage(),
      SettingsPage(
        scaffoldKey: _scaffoldKey,
      )
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(00.0),
        child: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          //title: Text(widget.title),

          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SafeArea(top: false, child: tabs[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('Analytics'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('History'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

}
