import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:note_app/database/notes_data.dart';

import '../note_view/note_view.dart';

class Trash extends StatefulWidget {
  const Trash({super.key});

  @override
  State<Trash> createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  child: Icon(Icons.list),
                ),
              ],
            ),

            // show note list
            NotesData.trashList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: NotesData.trashList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteDetails( noteIndex: index, whichPage: 'trash',
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
                                  title: Text(
                                    "Choose any option",
                                  ),
                                  content:      ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  actions: [

                                    ElevatedButton(
                                      onPressed: () {
                                        NotesData.trashList.removeAt(
                                          index,
                                        ); // remove to trust
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Text("Delete",
                                style: TextStyle(fontSize: 15),
                                ),
                                    ),

                                    ElevatedButton(
                                      onPressed: () {
                                        NotesData.list.add(
                                          NotesData.trashList[index],
                                        ); // save to trust
                                        NotesData.trashList.removeAt(index);

                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Text("Restore",
                                      style: TextStyle(fontSize: 15),),
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
                                "${NotesData.trashList[index]["title"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20
                                ),
                                maxLines: 1,
                              ),
                              subtitle: Text(
                                "${NotesData.trashList[index]["details"]}",
                                maxLines: 2,
                              ),

                              trailing: Text(
                                "${NotesData.trashList[index]["created_at"]["shortDate"]}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Center(child: Text(
                      "No trash Notes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),
          ],
        ),
      ),
    );
  }
}
