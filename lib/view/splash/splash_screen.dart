import 'package:flutter/material.dart';
import 'package:note_app/view/bottom/bottom.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  void delayTime() async{
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomSwitchScreen(),));
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
