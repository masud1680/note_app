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
          // note card shep changes
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            width: 35,
            child: Icon(Icons.list,size: 25,),
          ),
          // settings
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(splashColor: Colors.transparent,
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
                child: Icon(Icons.hexagon_outlined, size: 25,),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
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
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
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
                          builder: (context) => NoteDetails( noteIndex: index, whichPage: 'note',),),).then((value) {
                            setState(() {
                              
                            });
                          },);
                    },

                    onLongPress: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Are you sure to delete this Note"),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  NotesData.trashList.add(
                                    NotesData.list[index],
                                  ); // save to trust
                                  NotesData.list.removeAt(index);

                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text("Confirm"),
                              ),
                            ],
                          );
                        },
                      );
                      setState(() {});
                    },

                    child: Card(
                      color: Color(0xFFE8DEE6),
                      child: ListTile(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        ),
                        tileColor: Colors.green[100],
                        title: Text(
                          "${NotesData.list[index]["title"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "${NotesData.list[index]["details"]}",
                          maxLines: 2,
                        ),

                        trailing: Text(
                          "${NotesData.list[index]["created_at"]["shortDate"]}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
            MaterialPageRoute(builder: (context) => NoteModify(noteIndex: -1 ,)),
          ).then((value) {
            setState(() {});
          });
        },
        child: Text("ADD"),
      ),
    );
  }
}
