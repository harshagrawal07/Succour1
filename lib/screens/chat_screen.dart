import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:succour/helper/constants.dart';
import 'package:succour/services/database.dart';

class ChatScreen extends StatefulWidget {

  final String userName;
  final String chatRoomId;
  ChatScreen({
    this.userName,
    this.chatRoomId
});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  DatabseMethods databseMethods =new DatabseMethods();
  TextEditingController messageTextEditingController = new TextEditingController();
  Stream chatMessageStream;
  Widget ChatMessageList(){
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context, snapshot){
        return snapshot.hasData ? ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
              return MessageTile(snapshot.data.docs[index]["message"],snapshot.data.docs[index]["sendBy"] == Constants.myName);
            }) : Container();
      },

    );

  }

  sendMessage(){
    if(messageTextEditingController.text.isNotEmpty){
      Map<String, dynamic> messageMap={
        "message" : messageTextEditingController.text,
        "sendBy" : Constants.myName,
        "time" : DateTime.now().millisecondsSinceEpoch,
      };
      databseMethods.addConversationMessages(widget.chatRoomId, messageMap);
      messageTextEditingController.text="";
    }
  }
  @override
  void initState() {
    databseMethods.getConversationMessages(widget.chatRoomId).then((val){
      setState(() {
        chatMessageStream = val;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: widget.userName.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),

      ),
      body: Container(
        child: Stack(
          children: [
            ChatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 70,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.photo),
                      iconSize: 25,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        controller: messageTextEditingController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Send a message..',
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      iconSize: 25,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        sendMessage();
                      },
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class MessageTile  extends StatelessWidget {

  final bool isSendByMe;
  final String message;
  MessageTile(this.message, this.isSendByMe);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: isSendByMe ? 0 : 8 , right: isSendByMe ? 8 : 0),
      margin: EdgeInsets.symmetric(vertical: 4),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xff007EF4),
              const Color(0xff2A75BC)
            ]

          ),
         borderRadius: isSendByMe ?
         BorderRadius.only(
           topLeft: Radius.circular(20),
           topRight: Radius.circular(20),
           bottomLeft: Radius.circular(20),
         ) :
         BorderRadius.only(
           topLeft: Radius.circular(20),
           topRight: Radius.circular(20),
           bottomRight: Radius.circular(20),
         )

        ),
        child: Text(message, style: TextStyle(
          fontSize: 17,
          color: Colors.white70,
        ),),
      ),
    );
  }
}
