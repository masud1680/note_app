import 'package:flutter/material.dart';
import 'package:note_app/view/note/widgets/note_searchBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController inputQuery = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),

        centerTitle: true,
        title: TextField(
          controller: ,
          onChanged: (value) {

          },
          decoration: InputDecoration(

            contentPadding: EdgeInsets.symmetric(vertical: 0.1),

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
            hintStyle: TextStyle(color: Color(0xFFB3B3B3),),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Center(),
    );
  }
}
