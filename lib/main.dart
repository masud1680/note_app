


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:note_app/view/bottom/bottom.dart';
import 'package:note_app/view/note/note.dart';
import 'package:note_app/view/note/note_screen.dart';
import 'package:note_app/view/splash/splash_screen.dart';
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main(){

  runApp(
    MaterialApp(
      navigatorObservers: [routeObserver], // Add the observer here
      debugShowCheckedModeBanner: false,
      // home: BottomSwitchScreen(),
      home: SplashScreen(),
      builder: EasyLoading.init(),
      // home: NoteScreen(),
    )
  );
}