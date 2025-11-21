import 'package:flutter/material.dart';
import 'package:note_app/database/notes_data.dart';
import 'package:note_app/view/note_add_edit/note_add_edit.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({
    super.key,  required this.noteIndex, required this.whichPage,

  });

  final int noteIndex ;
  final String whichPage ;


  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {

    });
  }

  // get single note data
  late Map<String,dynamic> singleNoteData = widget.whichPage == "note" ? NotesData.list[widget.noteIndex] : NotesData.trashList[widget.noteIndex];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
        title: Text("Note View"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            if(widget.whichPage == "note"){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NoteModify(noteIndex: widget.noteIndex,),)).then((value) {
                setState(() {
                  singleNoteData = widget.whichPage == "note" ? NotesData.list[widget.noteIndex] : NotesData.trashList[widget.noteIndex];
                });
              },);
            }
          },
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
                        "${singleNoteData["created_at"]["date"]} / ${singleNoteData["created_at"]["time"]}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  // title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${singleNoteData["title"]}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  // details
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${singleNoteData["details"]}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
