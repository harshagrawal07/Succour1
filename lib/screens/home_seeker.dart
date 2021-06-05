import 'package:flutter/material.dart';
import 'package:succour/helper/constants.dart';
import 'package:succour/screens/profileView.dart';
import 'package:succour/screens/screens.dart';
import 'package:succour/services/auth.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:succour/screens/chats.dart';
import 'package:succour/screens/profile.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGridScreen(),
    );
  }
}

class MyGridScreen extends StatefulWidget {
  MyGridScreen({Key key}) : super(key: key);

  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  AuthMethods authMethods = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('SUCCOUR'),
        backgroundColor: Colors.blue,
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
      body: new GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (detail) {
          print(detail);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            new SizedBox(height: 20.0),
            /*new Container(
              height: 60.0,
              color: Colors.blue,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(Icons.hourglass_empty,
                      color: Colors.white, size: 30.0),
                  new Padding(padding: const EdgeInsets.only(right: 5.0)),
                ],
              ),
            ),*/
            new SizedBox(height: 20.0),
            new Container(
              child: new ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return new Column(
                    children: <Widget>[
                      new Container(
                        height: 50.0,
                        color: Colors.white,
                        child: new Row(

                          children: <Widget>[
                            new Padding(
                                padding: const EdgeInsets.only(right: 5.0)),
                            new Text( 'How are you feeling?',
                                style: new TextStyle(
                                    fontSize: 30.0, color: Colors.black)),
                          ],
                        ),
                      ),
                      new Container(
                        height: 120.0,
                        child: new ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return new GestureDetector(
                              child: new Card(
                                elevation: 5.0,
                                child: new Container(
                                  color: Colors.blue[50],
                                  height: MediaQuery.of(context).size.width / 10,
                                  width: MediaQuery.of(context).size.width / 3,
                                  alignment: Alignment.center,
                                  child: new Text('Happiness level  $index'),
                                ),
                              ),
                              onTap: () {
                                print(123);
                              },
                            );
                          },
                        ),
                      ),
                      new SizedBox(height: 20.0),
                      new Container(
                        height: 50.0,
                        color: Colors.white,
                        child: new Row(

                          children: <Widget>[
                            new Padding(
                                padding: const EdgeInsets.only(right: 5.0)),
                            new Text( 'Connect to a Volunteer',
                                style: new TextStyle(
                                    fontSize: 30.0, color: Colors.black)),
                          ],
                        ),
                      ),
                      new Container(
                        height: 120.0,
                        child: new ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return new GestureDetector(
                              child: new Card(
                                elevation: 5.0,
                                child: new Container(
                                  color: Colors.pink[50],
                                  height: MediaQuery.of(context).size.width / 10,
                                  width: MediaQuery.of(context).size.width / 3,
                                  alignment: Alignment.center,
                                  child: new Text('Volunteer  $index'),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ProfileView()));
                              },
                            );
                          },
                        ),
                      ),
                      new SizedBox(height: 20.0),
                      new Container(
                        height: 50.0,
                        color: Colors.white,
                        child: new Row(

                          children: <Widget>[
                            new Padding(
                                padding: const EdgeInsets.only(right: 5.0)),
                            new Text( 'Scheduled Appointments',
                                style: new TextStyle(
                                    fontSize: 30.0, color: Colors.black)),
                          ],
                        ),
                      ),
                      new Container(
                        child: SfCalendar(
                          view: CalendarView.month,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

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
                    child:Text("Seeker",
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