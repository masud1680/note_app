import 'dart:math';

import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:note_app/view/note/note.dart';
import 'package:note_app/view/note_add_edit/note_add_edit.dart';
import 'package:note_app/view/settings/settings.dart';


import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../trash/trash.dart';

class BottomSwitchScreen extends StatefulWidget {
  const BottomSwitchScreen({super.key});

  @override
  State<BottomSwitchScreen> createState() => _BottomSwitchScreenState();
}

class _BottomSwitchScreenState extends State<BottomSwitchScreen> {
  // State variable to hold the selected index
  int pageIndex = 0;

  List screen = [NoteDisplay(), Trash()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[pageIndex],
      bottomNavigationBar: Theme(
        // This creates a custom theme ONLY for this widget subtree
        data: Theme.of(context).copyWith(
          // 1. Remove the ripple/splash effect
          splashColor: Colors.transparent,

          // 2. Remove the solid highlight effect that appears on hold
          highlightColor: Colors.transparent,

          // Optional: For newer Flutter versions/Material 3, you can use:
          // splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFFAFAFA),
          selectedItemColor: Colors.blue,


          currentIndex: pageIndex,
          onTap: (index) {

            pageIndex = index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              label: "Notes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete_forever),
              label: "trash",
            ),
          ],
        ),
      ),

    );
  }
}
