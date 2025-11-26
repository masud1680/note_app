import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/database/notes_data.dart';
import 'package:note_app/view/note/widgets/note_searchBar.dart';
import 'package:note_app/view/note/widgets/note_single_card.dart';
import 'package:note_app/view/note_add_edit/note_add_edit.dart';
import 'package:note_app/view/note_view/note_view.dart';
import 'package:note_app/view/search/search_screen.dart';
import 'package:note_app/view/settings/settings.dart';
import 'package:intl/intl.dart';

import '../../database/local_database.dart';

class NoteDisplay extends StatefulWidget {
  const NoteDisplay({super.key});

  @override
  State<NoteDisplay> createState() => _NoteDisplayState();
}

class _NoteDisplayState extends State<NoteDisplay> {
  // popup note card start

  // Function to show the custom popup card
  void _showCustomCard(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        // This widgets is what appears as the popup on the screen
        return AlertDialog(
          backgroundColor: Colors.white,
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

  // popup note card close

  // Database start
  List<Map<String, dynamic>> allNotes = [];
  DBHelper? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
    getNotes();
  }

  void getNotes() async {
    allNotes = await dbRef!.getAllNotes();
    setState(() {});
  }

  // Database close

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        leading: SizedBox(),
        centerTitle: true,
        title: Text("Masud"),
        actions: [
          // note card shep changes
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            width: 35,
            child: Icon(Icons.list, size: 25),
          ),
          // settings
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                width: 35,
                child: Icon(Icons.hexagon_outlined, size: 25),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Color(0xFFF5F5F5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  // popup  card button
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      // 2. Call the function to show the dialog when pressed
                      _showCustomCard(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFFF4A758),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Notes",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Search box
                  NoteSearchBarWidget(),
                ],
              ),
            ),
            // show note list
            Expanded(
              child: ListView.builder(
                itemCount: allNotes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    overlayColor: WidgetStateColor.transparent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NoteDetails(noteIndex: index, whichPage: 'note'),
                        ),
                      ).then((value) {
                        setState(() {
                          getNotes();
                        });
                      });
                    },

                    onLongPress: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text("Are you sure to delete this Note"),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),

                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.red,
                                  ),
                                ),
                                onPressed: () async {
                                  // NotesData.trashList.add(
                                  //   NotesData.list[index],
                                  // ); // save to trust
                                  // NotesData.list.removeAt(index);

                                  var delTitle = allNotes[index]["title"];
                                  var delDesc = allNotes[index]["desc"];
                                  var delAt =
                                      DateTime.now().millisecondsSinceEpoch;

                                  await dbRef!.addTRASHNote(
                                    mTitle: delTitle,
                                    mDesc: delDesc,
                                    mDeletedAt: delAt,
                                  );

                                  bool check = await dbRef!.deleteNote(
                                    sno:
                                        allNotes[index][DBHelper
                                            .COLUMN_NOTE_SNO],
                                  );
                                  if (check) {
                                    getNotes();
                                  }

                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      setState(() {});
                    },

                    child: NoteSingleCard(
                      index: index,
                      whichPage: 'note',
                      singleNoteMapIn: allNotes[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: InkWell(
        overlayColor: WidgetStateColor.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteModify(noteIndex: -1)),
          ).then((value) {
            setState(() {
              getNotes();
            });
          });
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,

          radius: 30,
          child: Icon(
            Icons.add,
            color: Colors.blue,
            size: 35,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }
}
