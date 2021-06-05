import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:succour/screens/home-screen.dart';
import 'package:succour/services/auth.dart';
import 'package:succour/services/database.dart';
import 'package:succour/widgets/widgets.dart';
import 'package:succour/helper/helperFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthMethods authMethods = new AuthMethods();
  DatabseMethods databseMethods =new DatabseMethods();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  QuerySnapshot userInfoSnapshot;

  signIn(){
    if(formkey.currentState.validate()){

      //HelperFunctions.saveUserNameSharedPreference(userNameTextEditingController.text);
      HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);

      setState(() {
        isLoading = true;
      });

      databseMethods.getUserByUserEmail(emailTextEditingController.text).then((val){
        userInfoSnapshot = val;
        HelperFunctions.saveUserNameSharedPreference(userInfoSnapshot.docs[0]["name"]);
      });
      authMethods.signInWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((val){
        if(val != null){
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MyHomePage()));
        }
      });
    }
  }

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
                  Form(
                    key: formkey,
                    child: Column(children: [
                      TextInputField(
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        myController: emailTextEditingController,
                      ),
                      PasswordInput(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Password',
                        inputAction: TextInputAction.done,
                        myController: passwordTextEditingController,
                      ),
                    ],),
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
                      signIn();
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