import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:succour/helper/constants.dart';
import 'package:succour/helper/helperFunctions.dart';
import 'package:succour/screens/chat_screen.dart';
import 'package:succour/screens/profile.dart';
import 'package:succour/screens/home-screen.dart';
import 'package:succour/screens/chatSearchScreen.dart';
import 'package:succour/services/auth.dart';
import 'package:succour/services/database.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  DatabseMethods databseMethods = new DatabseMethods();
  AuthMethods authMethods = new AuthMethods();
  Stream chatRoomStreams;

  Widget chatRoomList(){
    return StreamBuilder(
      stream: chatRoomStreams,
      builder: (context, snapshot){
        return snapshot.hasData? ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
              return ChatRoomsTile(snapshot.data.docs[index].data["charooomId"].toString().replaceAll("_", "").replaceAll(Constants.myName, ""),
                  snapshot.data.docs[index].data["charooomId"]);
            }) : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  getUserInfo() async{
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    databseMethods.getChatRooms(Constants.myName).then((val){
      setState(() {
        chatRoomStreams = val;
        print(
            "we got the data + ${chatRoomStreams.toString()} this is name  ${Constants.myName}");
      });
    });
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        title: Text(
          'Inbox',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatSearchScreen()));
            },
          ),
        ],
      ),
      body: Container(
        child: chatRoomList(),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {

  final String userName;
  final String chatRoomId;
  ChatRoomsTile(this.userName, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(userName: userName, chatRoomId: chatRoomId)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Text("${userName.substring(0,1).toUpperCase()}", ),
            ),
            SizedBox(width: 10,),
            Text(userName.toUpperCase(), style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),)
          ],
        ),
      ),
    );
  }
}