import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/database/notes_data.dart';
import 'package:note_app/view/note/note.dart';

class NoteModify extends StatefulWidget {
  const NoteModify({super.key, required this.noteIndex});

  final int noteIndex; // received index

  // timer start
  @override
  State<NoteModify> createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  late DateTime _currentTime;
  late Timer _timer;

  @override
  void initState() {

    if(widget.noteIndex != -1){
      int index = widget.noteIndex;
      addDataTextField(index);
    }


    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Important: cancel the timer when the widget is disposed
    super.dispose();
  } // timer stop



  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  void addDataTextField(index) {
    titleController.text = NotesData.list[index]["title"];
    detailsController.text = NotesData.list[index]["details"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text("Note Editor"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // date
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${_currentTime.day}-${_currentTime.month}-${_currentTime.year}    <|>       ${_currentTime.hour} : ${_currentTime.minute} : ${_currentTime.second}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                // title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: titleController,
                    maxLines: 5,
                    minLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      hintText: "Title",

                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),

                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),

                // details
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: detailsController,
                    maxLines: 1000,
                    decoration: InputDecoration(
                      hintText: "Details....",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: ElevatedButton(
        onPressed: () {


          if (titleController.text.isNotEmpty &&
              detailsController.text.isNotEmpty) {
            Map<String, dynamic> singleNoteMap = {
              "id": widget.noteIndex != -1 ? widget.noteIndex : NotesData.list.length,
              "title": titleController.text,
              "details": detailsController.text,
              "created_at": {
                "shortDate": " ${_currentTime.day}/${_currentTime.month}",
                "date":
                "${_currentTime.day}-${_currentTime.month}-${_currentTime.year}",
                "time":
                "${_currentTime.hour}:${_currentTime.minute}:${_currentTime.second}",
              },
            };
            if(widget.noteIndex == -1){
              NotesData.list.add(singleNoteMap);
            }else{
              NotesData.list[widget.noteIndex] = singleNoteMap;
            }

          } else {
            log("not saved......");
          }




          Navigator.pop(context);

        },
        child: Text("Save"),
      ),
    );
  }
}
