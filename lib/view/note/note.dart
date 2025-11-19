import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/database/notes_data.dart';
import 'package:note_app/view/note_add_edit/note_add_edit.dart';
import 'package:note_app/view/note_view/note_view.dart';
import 'package:note_app/view/settings/settings.dart';
import 'package:note_app/view/trust/trust.dart';

class NoteDisplay extends StatefulWidget {
  const NoteDisplay({super.key});

  @override
  State<NoteDisplay> createState() => _NoteDisplayState();
}

class _NoteDisplayState extends State<NoteDisplay> {
  // Function to show the custom popup card
  void _showCustomCard(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        // This widget is what appears as the popup on the screen
        return AlertDialog(
          // Use the 'shape' property to give the card rounded corners
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          // Title and content are optional, but define the card's structure
          title: const Text('Popup Card Title'),
          content: const SizedBox(
            width: 300, // You can control the size of the content area
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'This is the content of the popup card.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Divider(),
                // Example of a list item inside the card
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings Option'),
                ),
              ],
            ),
          ),
          // Actions usually contain buttons to close or confirm
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Closes the popup and returns to the previous screen
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Masud"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.settings_rounded),
                ),
              ),
            ),
          ),

          // 1. The Icon Button (where the click action is defined)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            InkWell(
              onTap: () {
                // 2. Call the function to show the dialog when pressed
                _showCustomCard(context);
              },
              child: Card(
                color: Colors.green,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.open_in_browser, color: Colors.white),
                ),
              ),
            ),

            //Search box
            Row(
              children: [
                //input search box
                Expanded(
                  child: TextField(
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
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4A758),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  width: 50,
                  child: Icon(Icons.tune_sharp),
                ),
              ],
            ),

            // show note list
            Expanded(
              child: ListView.builder(
                itemCount: NotesData.list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteDetails(
                            title: '${NotesData.list[index]["title"]}',
                            details: '${NotesData.list[index]["details"]}',
                            created_at:'Last edited : ${NotesData.list[index]["created_at"]}',
                          ),
                        ),
                      );
                    },

                    onLongPress: () {

                      NotesData.trustList.add(NotesData.list[index]); // save to trust
                      NotesData.list.removeAt(index);


                      setState(() {});

                    },

                    child: Card(
                      color: Color(0xFFE8DEE6),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            // title & date
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // title
                                Text(
                                  "${NotesData.list[index]["title"]}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Last edited : ${NotesData.list[index]["created_at"]}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            // image
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteModify()),
          ).then((value) {
            setState(() {});
          });
        },
        child: Text("ADD"),
      ),
    );
  }
}
