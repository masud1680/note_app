


import 'package:flutter/material.dart';
import 'package:note_app/view/bottom/bottom.dart';
import 'package:note_app/view/note/note.dart';
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main(){

  runApp(
    MaterialApp(
      navigatorObservers: [routeObserver], // Add the observer here
      debugShowCheckedModeBanner: false,
      home: BottomSwitchScreen(),
      // home: NoteDisplay(),
    )
  );
}