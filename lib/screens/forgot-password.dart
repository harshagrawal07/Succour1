import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:succour/widgets/text-field-input.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ),
            title: Text(
              'Forgot Password',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  height: 1.5
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        'Enter your email we will send instruction to reset your password',
                        style:TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    MaterialButton(
                      minWidth: 300.0,
                      height: 60,
                      onPressed: () {
                      },
                      color: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),

                      child: Text(
                        "Send",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );


  }
}