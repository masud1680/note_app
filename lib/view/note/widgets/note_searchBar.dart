import 'package:flutter/material.dart';
class NoteSearchBarWidget extends StatelessWidget {
  const NoteSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 1),
        filled: true,
        fillColor: Color(0xFFF5F5F5),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Icon(
            Icons.search,
            color: Color(0xFFB3B3B3),
            size: 20,
          ),
        ),
        hintText: "Search Products",
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