import 'package:flutter/material.dart';
import 'package:succour/Mood%20Tracker/pages/settings.dart';
import 'pages/homeApp/home.dart';
import 'pages/homeApp/moodSelect2.dart';
import 'pages/iconCheatSheet.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('Navigating to route:' + settings.name);
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MoodTracker());
      case '/ms2':
        return MaterialPageRoute(builder: (context) => MoodSelect2(refresh: args,));
      case '/cheatSheet':
        return MaterialPageRoute(builder: (context) => IconSheet());
      case '/cheatSheet':
        return MaterialPageRoute(builder: (context) => SettingsPage());

    }
    return MaterialPageRoute(
        builder: (context) => Text("Broken"));
  }
}

