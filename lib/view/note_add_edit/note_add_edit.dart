import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/database/notes_data.dart';
import 'package:note_app/view/note/note.dart';
import 'package:note_app/view/note_add_edit/widgets/editor_data_save_button.dart';
import 'package:note_app/view/note_add_edit/widgets/editor_details_input_field_widget.dart';
import 'package:note_app/view/note_add_edit/widgets/editor_title_input_field_widget.dart';
import 'package:note_app/view/note_add_edit/widgets/show_realtime_date_time_widget.dart';

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
    _timer.cancel(); // Important: cancel the timer when the widgets is disposed
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
                ShowRealtimeDateTimeWidget(currentTime: _currentTime),

                SizedBox(height: 20),
                // title
                EditorTitleInputFieldWidget(titleController: titleController),

                // details
                EditorDetailsInputFieldWidget(detailsController: detailsController),
              ],
            ),
          ),
        ),
      ),
// save note information
      floatingActionButton: EditorDataSaveButton(titleController: titleController, detailsController: detailsController, widget: widget, currentTime: _currentTime),
    );
  }
}








