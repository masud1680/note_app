import 'package:flutter/material.dart';
import 'package:note_app/database/notes_data.dart';
import 'package:note_app/view/note_add_edit/note_add_edit.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({
    super.key, required this.SingleNoteData, required this.noteIndex,

  });
  final int noteIndex ;
  final Map<String,dynamic> SingleNoteData ;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
        title: Text("Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteModify(noteIndex: widget.noteIndex,),)).then((value) {
              setState(() {

              });
            },);
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
                        "${NotesData.list[widget.noteIndex]["created_at"]["date"]} / ${NotesData.list[widget.noteIndex]["created_at"]["time"]}",
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
                      "${NotesData.list[widget.noteIndex]["title"]}",
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
                      "${NotesData.list[widget.noteIndex]["details"]}",
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
