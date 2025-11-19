import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:note_app/database/notes_data.dart';

import '../note_view/note_view.dart';

class Trust extends StatefulWidget {
  const Trust({super.key});

  @override
  State<Trust> createState() => _TrustState();
}

class _TrustState extends State<Trust> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Trust"),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 15),
        //     child: InkWell(
        //       onTap: () {
        //         // Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(),));
        //       },
        //       child: Card(
        //         child: Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Icon(Icons.settings_rounded),
        //         ),
        //       ),
        //     ),
        //   ),
        //
        //   // 1. The Icon Button (where the click action is defined)
        // ],
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
                  child: Icon(Icons.tune_sharp),
                ),
              ],
            ),

            // show note list
            NotesData.trustList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: NotesData.trustList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDetails(title: '${NotesData.trustList[index]["title"]}', details: '${NotesData.trustList[index]["details"]}', created_at: 'Last edited : ${NotesData.trustList[index]["created_at"]}',),));
                          },
                          onLongPress: () {


                            NotesData.trustList.removeAt(index);// remove to trust


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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // title
                                      Text(
                                        "${NotesData.trustList[index]["title"]}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Last edited : ${NotesData.trustList[index]["created_at"]}",
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
                  )
                : Center(child: Text("Empty")),
          ],
        ),
      ),
      
      floatingActionButton: ElevatedButton(onPressed: () {
        setState(() {
          
        });
      }, child: Icon(Icons.refresh)),
    );
  }
}
