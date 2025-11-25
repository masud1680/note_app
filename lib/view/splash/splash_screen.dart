import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/view/authentication/signIn_screen.dart';
import 'package:note_app/view/bottom/bottom.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  void delayTime() async{
    await Future.delayed(Duration(seconds: 1));

    // // Obtain shared preferences.
    final SharedPreferences prefsLogin =
    await SharedPreferences.getInstance();

    // // Save an boolean value to 'repeat' key.
    var isLogin = prefsLogin.getBool('isLogin');

    if(isLogin == true){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  BottomSwitchScreen(),));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  SignInScreen(),));
    }


  }
  
  @override
  void initState() {
    delayTime();
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image(image: AssetImage("assets/splash_screen/splash_img.png"))),
    );
  }
}
