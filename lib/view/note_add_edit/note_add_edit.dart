import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:note_app/view/bottom/bottom.dart';
import 'package:note_app/view/note/note.dart';

import 'package:note_app/view/note_add_edit/widgets/editor_details_input_field_widget.dart';
import 'package:note_app/view/note_add_edit/widgets/editor_title_input_field_widget.dart';
import 'package:note_app/view/note_add_edit/widgets/show_realtime_date_time_widget.dart';

import '../../controller/add.dart';



class NoteModify extends StatefulWidget {
  const NoteModify({super.key, required this.whichPage, this.noteId, this.note, });

  final String whichPage;
  final int? noteId; // received note id
  final String? note;


  // timer start
  @override
  State<NoteModify> createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {




  TextEditingController detailsController = TextEditingController();

  void addDataTextField(index) {

    detailsController.text = widget.note ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomSwitchScreen()));
          },
            child: Icon(Icons.arrow_back)
        ),
        title: Text(
            widget.whichPage,
          style: TextStyle(
            fontSize: 16
          ),
        ),

        actions: [
          // Left arrow button
          InkWell(splashColor: Colors.transparent,
            onTap: () {

            },
            child: Container(
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 35,
              child: Icon(Icons.undo_outlined, size: 25,),
            ),
          ),
          // right arrow button
          InkWell(splashColor: Colors.transparent,
            onTap: () {

            },
            child: Container(
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 35,
              child: Icon(Icons.redo_outlined, size: 25,),
            ),
          ),

          // Save Note data
          InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onTap: () async{


              var desc = detailsController.text;



              if (desc.isNotEmpty) {

  if(widget.whichPage == "Note Add"){
    AddNoteToApi().addNote();
  }


              } else {
                log("not saved......");
              }




              Navigator.pop(context);

            },
            child: Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 35,
              child: Icon(Icons.check, size: 30,),
            ),
          ),
        ],
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


                // details
                EditorDetailsInputFieldWidget(detailsController: detailsController),
              ],
            ),
          ),
        ),
      ),

    );
  }
}








