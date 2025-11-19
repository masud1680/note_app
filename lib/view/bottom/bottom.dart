import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:note_app/view/note/note.dart';
import 'package:note_app/view/note_add_edit/note_add_edit.dart';
import 'package:note_app/view/settings/settings.dart';
import 'package:note_app/view/trust/trust.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomSwitchScreen extends StatefulWidget {
  const BottomSwitchScreen({super.key});

  @override
  State<BottomSwitchScreen> createState() => _BottomSwitchScreenState();
}

class _BottomSwitchScreenState extends State<BottomSwitchScreen> {
  // State variable to hold the selected index
  int pageIndex = 0;

  List screen = [NoteDisplay(), NoteModify(), Trust()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screen[pageIndex],
      bottomNavigationBar:  PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: NoteDisplay(),
            item: ItemConfig(
              icon: Icon(Icons.folder_copy_outlined),
              title: "Note",
            ),
          ),

          PersistentTabConfig(
            screen: Trust(),
            item: ItemConfig(
              icon: Icon(Icons.delete_outline_outlined),
              title: "Trust",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style1BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
