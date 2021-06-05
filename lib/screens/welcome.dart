import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:succour/screens/login-screen.dart';
import 'package:succour/screens/login-screen2.dart';
import 'package:succour/screens/screens.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          Flexible(
            child: Center(
              child: Text(
                'Succour',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight:FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              MaterialButton(
                minWidth: 300.0,
                height: 60,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen2()));
                },
                color: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "Seeker",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24
                  ),
                ),
              ),
              SizedBox(height: 55),
              MaterialButton(
                minWidth: 300.0,
                height: 60,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                color: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Text(
                  "Volunteer",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          )
        ],
      ),
    );
  }
}