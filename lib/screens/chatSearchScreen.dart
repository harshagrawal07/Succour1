import 'package:flutter/material.dart';
import 'package:succour/helper/constants.dart';
import 'package:succour/screens/chat_screen.dart';
import 'package:succour/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatSearchScreen extends StatefulWidget
{
  @override
  _ChatSearchScreen createState() => _ChatSearchScreen();
}

class _ChatSearchScreen extends State<ChatSearchScreen>{

  DatabseMethods databseMethods = new DatabseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();
  QuerySnapshot searchSnapshot;


  initiateSearch(){
  databseMethods.getUserByUsername(searchTextEditingController.text).then((val){
    setState(() {
      searchSnapshot = val;
    });
  });
}

  createChatroomForUser({String userName}){
    if(userName != Constants.myName){
      String chatRoomId = getChatRoomId(userName, Constants.myName);
      List<String> users = [userName, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "charooomId": chatRoomId,
      };

      databseMethods.createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(userName: userName, chatRoomId: chatRoomId)));
    }else{
      print("");
    }
  }



  Widget searchList(){
    return searchSnapshot != null ? ListView.builder(
        itemCount: searchSnapshot.docs.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return ChatSearchTitle(
            username: searchSnapshot.docs[index]["name"],
            useremail: searchSnapshot.docs[index]["email"],
          );
        }) : Container();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget ChatSearchTitle({String username, String useremail}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username, style: TextStyle(),),
              Text(useremail, style: TextStyle(),),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              createChatroomForUser(
                userName: username
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Message", style: TextStyle(
                  color: Colors.white
              ),),
            ),
          )
        ],
      ),

    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: TextField(
            controller: searchTextEditingController,
            decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Search by username',
              hintStyle: TextStyle(
                color: Colors.white
              )
            ),
          ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: (){
                initiateSearch();
              })

        ],
        ),
      body: Container(
        child: Column(
          children: [
            searchList()
          ],
        ),
      ),
      );
  }
}

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}