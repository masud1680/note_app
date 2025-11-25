
import 'package:flutter/material.dart';
import 'package:note_app/view/authentication/signIn_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordVisible = true;

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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
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
                              color: Color(0xFFD9D9D9),
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
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
                              color: Color(0xFFF4A758),
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
              //Phone number & password
              Column(
                spacing: 10,
                children: [
                  // name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Enter your name",
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
                  // phone number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter your phone number",
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

                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              //Login with login google facebook buttons
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                child: InkWell(
                  onTap: () {
                    print("register clicked...");
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
                        "Register",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
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
