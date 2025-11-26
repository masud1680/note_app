import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_app/view/note/widgets/note_searchBar.dart';
import 'package:note_app/view/note/widgets/note_single_card.dart';

import '../../database/local_database.dart';
import '../note_view/note_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.whichPage});

  final String whichPage;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Database start
  List<Map<String, dynamic>> allAvailableNotes = [];
  List<Map<String, dynamic>> queryResultNotes = [];
  DBHelper? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
    getNotes();
  }

  void getNotes() async {
    // initially all available notes get from database
    widget.whichPage == "trash"
        ? allAvailableNotes = await dbRef!.getAllTRASHNotes()
        : allAvailableNotes = await dbRef!.getAllNotes();
    // print("======Available======${allAvailableNotes}==============");

    setState(() {});
  }

  // Database close

  TextEditingController inputQuery = TextEditingController();

  // notes search and only match add queryResultNotes list
  void queryFindNotes() {
    for (dynamic singleMap in allAvailableNotes) {
      if (singleMap["title"].toLowerCase().contains(
            inputQuery.text.toLowerCase(),
          ) ||
          singleMap["desc"].toLowerCase().contains(
            inputQuery.text.toLowerCase(),
          )) {
        queryResultNotes.add(singleMap);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),

        centerTitle: true,
        title: TextField(
          controller: inputQuery,
          onChanged: (value) {
            queryResultNotes.clear();
            queryFindNotes();
            inputQuery.text.isEmpty ? queryResultNotes.clear() : null;
            setState(() {});
            // print("=========${inputQuery.text}===========");
            // print("==============${queryResultNotes}=================");
          },

          autofocus: true,
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
        ),
      ),
      body: queryResultNotes.isNotEmpty
          ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
                itemCount: queryResultNotes.length,
                itemBuilder: (context, index) {
                  return InkWell(

                    overlayColor: WidgetStateColor.transparent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NoteDetails(noteIndex: index, whichPage: widget.whichPage),
                        ),
                      ).then((value) {
                        setState(() {
                          getNotes();
                        });
                      });
                    },
                    child: NoteSingleCard(
                      index: index,
                      whichPage: widget.whichPage == "trash"
                          ? "trashSearch"
                          : "noteSearch",
                      singleNoteMap: queryResultNotes[index],
                    ),
                  );
                },
              ),
          )
          : Center(child: Text("No match items.")),
    );
  }
}
