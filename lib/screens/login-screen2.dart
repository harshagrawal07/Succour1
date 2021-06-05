import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:succour/screens/home_seeker.dart';
import 'package:succour/widgets/widgets.dart';

class LoginScreen2 extends StatelessWidget {
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
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextInputField(
                icon: FontAwesomeIcons.envelope,
                hint: 'Email',
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
              ),
              PasswordInput(
                icon: FontAwesomeIcons.lock,
                hint: 'Password',
                inputAction: TextInputAction.done,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              MaterialButton(
                minWidth: 300.0,
                height: 60,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyGridScreen()));
                },
                color: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),

                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'New User ? ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600
                  )
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'CreateNewAccount');
                },
                child: Text(
                  'Create an account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}