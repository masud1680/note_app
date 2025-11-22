import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../database/notes_data.dart';
import '../note_add_edit.dart';

class EditorDataSaveButton extends StatelessWidget {
  const EditorDataSaveButton({
    super.key,
    required this.titleController,
    required this.detailsController,
    required this.widget,
    required DateTime currentTime,
  }) : _currentTime = currentTime;

  final TextEditingController titleController;
  final TextEditingController detailsController;
  final NoteModify widget;
  final DateTime _currentTime;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
    );
  }
}