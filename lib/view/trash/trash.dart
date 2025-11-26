import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:note_app/database/notes_data.dart';
import 'package:note_app/view/note/widgets/note_single_card.dart';

import '../../database/local_database.dart';
import '../note_view/note_view.dart';
import '../search/search_screen.dart';

class Trash extends StatefulWidget {
  const Trash({super.key});

  @override
  State<Trash> createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  // Database start
  List<Map<String, dynamic>> allTrashNotes = [];
  DBHelper? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
    getTrashNotes();
  }

  void getTrashNotes() async {
    allTrashNotes = await dbRef!.getAllTRASHNotes();
    setState(() {
      print(allTrashNotes);
    });
  }

  // Database close

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        centerTitle: true,
        title: Text("Trash"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            //Search box
            TextField(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen(whichPage: 'trash',)),
                );
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
            ),

            // show note list
            allTrashNotes.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: allTrashNotes.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          overlayColor: WidgetStateColor.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteDetails(
                                  noteIndex: index,
                                  whichPage: 'trash',
                                ),
                              ),
                            );
                          },
                          onLongPress: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text("Choose any option"),
                                  content: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Colors.red,
                                        ),
                                      ),
                                      onPressed: () async {
                                        // NotesData.trashList.removeAt(
                                        //   index,
                                        // ); // remove to trust

                                        bool check = await dbRef!.deleteTRASHNote(
                                          sno:
                                              allTrashNotes[index][DBHelper
                                                  .COLUMN_NOTE_SNO],
                                        );
                                        if (check) {
                                          getTrashNotes();
                                        }

                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                    ElevatedButton(
                                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)),
                                      onPressed: () async {
                                        // NotesData.list.add(
                                        //   NotesData.trashList[index],
                                        // ); // save to trust
                                        // NotesData.trashList.removeAt(index);
                                        var reTitle =
                                            allTrashNotes[index]["title"];
                                        var reDes =
                                            allTrashNotes[index]["desc"];
                                        var reCreatedAt = DateTime.now()
                                            .millisecondsSinceEpoch;
                                        await dbRef!.addNote(
                                          mTitle: reTitle,
                                          mDesc: reDes,
                                          mCreatedAt: reCreatedAt,
                                        );

                                        bool check = await dbRef!.deleteTRASHNote(
                                          sno:
                                              allTrashNotes[index][DBHelper
                                                  .COLUMN_NOTE_SNO],
                                        );
                                        if (check) {
                                          getTrashNotes();
                                        }
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Text(
                                        "Restore",
                                        style: TextStyle(fontSize: 15, color: Colors.white),
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
                            whichPage: 'trash',
                            singleNoteMapIn: allTrashNotes[index],
                          ),
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: Center(
                      child: Text(
                        "No trash Notes",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
