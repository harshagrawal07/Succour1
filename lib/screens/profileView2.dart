import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('SUCCOUR'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(

          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "add you image URL here "
                      ),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 150,
                child: Container(
                  alignment: Alignment(0.0,2.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "Add you profile DP image URL here "
                    ),
                    radius: 60.0,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 60,
            ),
            Text(
              'Harshita S'
              ,style: TextStyle(
                fontSize: 25.0,
                color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Hyderabad, India"
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Seeker at SUCCOUR"
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 25,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Mood",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: (){
                  },

                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.blue,Colors.blueAccent]
                      ),
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Contact",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}