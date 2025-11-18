import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:note_app/view/note/note.dart';
import 'package:note_app/view/note_add_edit/note_add_edit.dart';
import 'package:note_app/view/settings/settings.dart';
import 'package:note_app/view/trust/trust.dart';

class BottomSwitchScreen extends StatefulWidget {
  const BottomSwitchScreen({super.key});

  @override
  State<BottomSwitchScreen> createState() => _BottomSwitchScreenState();
}

class _BottomSwitchScreenState extends State<BottomSwitchScreen> {
  // State variable to hold the selected index
  int pageIndex = 0;

  List screen = [NoteDisplay(), NoteModify(), Trust(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[pageIndex],



      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFFFCE9D8),
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home, color: Colors.grey,),
            label: 'Notes',
            labelStyle: pageIndex == 0 ? TextStyle(
                color: Color(0xFF2E2827),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ) : TextStyle(
                color: Color(0xFF757575),
                fontSize: 13,
                fontWeight: FontWeight.w500
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.add,color: Colors.grey,),
            label: 'Category',
            labelStyle: pageIndex == 1 ? TextStyle(
                color: Color(0xFF2E2827),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ) : TextStyle(
                color: Color(0xFF757575),
                fontSize: 13,
                fontWeight: FontWeight.w500
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.delete_forever,color: Colors.grey,),
            label: 'Trust',
            labelStyle: pageIndex == 2 ? TextStyle(
                color: Color(0xFF2E2827),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ) : TextStyle(
                color: Color(0xFF757575),
                fontSize: 13,
                fontWeight: FontWeight.w500
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.settings, color: Colors.grey,),
            label: 'Cart',
            labelStyle: pageIndex == 3 ? TextStyle(
                color: Color(0xFF2E2827),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ) : TextStyle(
                color: Color(0xFF757575),
                fontSize: 13,
                fontWeight: FontWeight.w500
            ),
          ),

        ],
        onTap: (index) {
          // Handle button tap
          pageIndex = index;
          setState(() {

          });

        },
      ),



    );
  }
}