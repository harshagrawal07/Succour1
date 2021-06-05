import 'package:flutter/material.dart';
import 'package:succour/helper/constants.dart';
import'package:succour/screens/pat-record.dart';
import 'package:succour/screens/chats.dart';
import 'package:succour/screens/profile.dart';
import 'package:succour/screens/screens.dart';
import 'package:succour/services/auth.dart';


class MyHomePage extends StatelessWidget {
  final String title=('SUCCOUR');
  AuthMethods authMethods = new AuthMethods();

  TextEditingController searchTextEditingController = new TextEditingController();
  MyHomePage({Key key, title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("SUCCOUR",style: TextStyle(fontSize:28)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              authMethods.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
            },
            child:
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)
                ,
              ),
          ),
        ],
      ),


      body: Patients(),


      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:Stack(
                children:<Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child:CircleAvatar(
                      backgroundColor: Colors.white54,//Image("https://unsplash.com/photos/OhKElOkQ3RE"),
                      radius:50.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:Text(Constants.myName.toUpperCase(),
                      style:TextStyle(color:Colors.white, fontSize:24),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight+Alignment(0,0.4),
                    child:Text("Volunteer",
                        style: TextStyle(color:Colors.white70)),
                  ),

                ],
              ) ,

              decoration:
              BoxDecoration(
                  color: Colors.blue
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profile())
                );

              },
            ),
            ListTile(
              title: Text('Chat'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Chats()));
              },
            ),
          ],
        ),
      ),
    );
  }
}