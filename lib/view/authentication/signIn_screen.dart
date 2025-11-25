import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/database/user_data.dart';
import 'package:note_app/view/authentication/signUp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottom/bottom.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool passwordVisible = true;
  final TextEditingController inputEmail = TextEditingController();
  final TextEditingController inputPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(color: Color(0xFFF5F5F5), height: 3.0),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              // Sign In & Sign Up button
              Row(
                children: [
                  //sign In button
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // print("Sign In Screen clicked...");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Column(
                        spacing: 5,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color(0xFF5B5B5B),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF4A758),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            width: double.infinity,
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //sign Up button
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // print("Sign Up Screen clicked...");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Column(
                        spacing: 5,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xFF5B5B5B),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            width: double.infinity,
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              //Simple welcome message
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Color(0XFF5B5B5B),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Please enter your details to login.",
                    style: TextStyle(
                      color: Color(0XFF9F9FA9),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              //Email number & password
              Column(
                spacing: 10,
                children: [
                  // phone number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: inputEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your email address",
                          hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // password number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: inputPassword,
                        obscureText: passwordVisible,

                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              passwordVisible = !passwordVisible;
                              setState(() {});
                            },
                            child: passwordVisible
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined),
                          ),
                          hintText: "****************",
                          hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              print("Forget Password Clicked.");
                            },
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                color: Color(0XFFF4A758),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),

              //Login with login google facebook buttons
              InkWell(
                onTap: () async {
                  // print("Login clicked...");
                  if (inputEmail.text == "" && inputPassword.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enter Email & Password")),
                    );
                  } else if (inputEmail.text == "") {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Enter Email.")));
                  } else if (inputPassword.text == "") {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Enter Password.")));
                  } else {
                    var userFind = UserData.user.where(
                      (value) => value["email"] == inputEmail.text && value["password"] == inputPassword.text,
                    );

                    if (userFind.isNotEmpty) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Login success.")));

                      // Obtain shared preferences.
                      final SharedPreferences prefsLogin =
                          await SharedPreferences.getInstance();
                      // Save an boolean value to 'repeat' key.
                      await prefsLogin.setBool('isLogin', true);
                      // var p = prefsLogin.getBool('isLogin');
                      //
                      // log("============${p}=============");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomSwitchScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Wrong user or password")),
                      );
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF4A758),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFD4D4D4),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
