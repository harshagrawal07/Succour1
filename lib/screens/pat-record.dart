import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:succour/screens/profileView2.dart';
import 'package:succour/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Patients extends StatelessWidget {

  DatabseMethods databseMethods = new DatabseMethods();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child:Column(
        children: <Widget>[
          headerwithserchbar(size: size),
          // Row{
          //     children:<Widget>[
          //
          //     ]
          //   },
          Container(
            height:24,
            child:Stack(
              children:<Widget>[
                Padding(
                  padding:const EdgeInsets.only(left:20.0/4),
                ),
                new SizedBox(height: 20.0),
                new Container(
                  height: 120.0,
                  child: new ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: FirebaseFirestore.instance.collection("users").toString().length,
                    itemBuilder: (context, index) {
                      return new GestureDetector(
                        child: new Card(
                          elevation: 5.0,
                          child: new Container(
                            color: Colors.pink[50],
                            height: MediaQuery.of(context).size.width / 10,
                            width: MediaQuery.of(context).size.width / 3,
                            alignment: Alignment.center,
                            child: new Text('Seeker $index'),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProfileView2()));
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom:0,
                    left:0,
                    right:0,
                    child:Container(
                      margin:EdgeInsets.only(right:20.0/4),
                      height:7,
                      color:Colors.blue.withOpacity(0),
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// ignore: camel_case_types
class headerwithserchbar extends StatelessWidget {
  const headerwithserchbar(
      {
    Key key,
    this.title,
    this.press,
    @required this.size,
  }) : super(key: key);
  final String title;
  final Function press;
  final Size size;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin:EdgeInsets.only(bottom:20.0 * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children:<Widget>[
          Container(
            padding:EdgeInsets.only(
              left:20.0,
              right:20.0,
              bottom:36+20.0,
            ),
            height: size.height*0.2-27,
            decoration: BoxDecoration(color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children:<Widget>[
                Text(
                  "Welcome Volunteer!",
                  style:Theme.of(context).textTheme.headline6.copyWith(
                      color:Colors.white, fontWeight:FontWeight.w600 ),
                ),
                Spacer(),
                //Image.assets("assets/images/logo.png");

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 550,
                    color: Colors.blue.withOpacity(0.23),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        //onChanged: {value}{},
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.blue.withOpacity(0.9),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    //SvgPicture.asset("assests/icons/search.svg"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),);
  }
}