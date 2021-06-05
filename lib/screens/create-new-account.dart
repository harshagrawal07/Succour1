import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:succour/helper/helperFunctions.dart';
import 'package:succour/screens/screens.dart';
import 'package:succour/services/auth.dart';
import 'package:succour/services/database.dart';
import 'package:succour/widgets/widgets.dart';

class CreateNewAccount extends StatefulWidget {

  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  DatabseMethods databseMethods = new DatabseMethods();

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  signUp() async {

    if(formKey.currentState.validate()){

      Map<String, String> userInfoMap ={
        "name" :  userNameTextEditingController.text,
        "email" : emailTextEditingController.text,
      };
      HelperFunctions.saveUserNameSharedPreference(userNameTextEditingController.text);
      HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);

      setState((){
        isLoading = true;
      });
      authMethods.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((val){
        //print("${val.uid}");


        databseMethods.uploadUserInfo(userInfoMap);
        HelperFunctions.saveUserLoggedInSharedPreference(false);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WelcomePage()));

      });

    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: isLoading ? Container(
            child: Center(
              child: Text(
              "Registered!!! Sign in.",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24
              ),)
          )) : SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.4,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          TextInputField(
                            icon: FontAwesomeIcons.user,
                            hint: 'User',
                            inputType: TextInputType.name,
                            inputAction: TextInputAction.next,
                            myController: userNameTextEditingController,
                          ),
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
                            inputAction: TextInputAction.next,
                            myController: passwordTextEditingController,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MaterialButton(
                        minWidth: 300.0,
                        height: 60,
                        onPressed: () {
                          signUp();

                        },
                        color: Colors.indigoAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600
                            )
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
  }
}