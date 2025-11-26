import 'dart:async';

import 'package:flutter/material.dart';

import '../../search/search_screen.dart';
class NoteSearchBarWidget extends StatelessWidget {
  const NoteSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(whichPage: 'note',),));

      },

      keyboardType: TextInputType.none,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        filled: true,
        fillColor: Color(0xFFE2E2E2),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Icon(
            Icons.search_outlined,
            color: Color(0xFFB3B3B3),
            size: 25,
          ),
        ),
        hintText: "Search",
        hintStyle: TextStyle(color: Color(0xFFB3B3B3)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}