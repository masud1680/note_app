// import 'dart:async';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:note_app/database/notes_data.dart';
// import 'package:note_app/view/bottom/bottom.dart';
// import 'package:note_app/view/note/note.dart';
//
// import 'package:note_app/view/note_add_edit/widgets/editor_details_input_field_widget.dart';
// import 'package:note_app/view/note_add_edit/widgets/editor_title_input_field_widget.dart';
// import 'package:note_app/view/note_add_edit/widgets/show_realtime_date_time_widget.dart';
//
// import '../../database/local_database.dart';
//
// class NoteModify extends StatefulWidget {
//   const NoteModify({super.key, required this.noteIndex});
//
//   final int noteIndex; // received index
//
//   // timer start
//   @override
//   State<NoteModify> createState() => _NoteModifyState();
// }
//
// class _NoteModifyState extends State<NoteModify> {
//   late DateTime _currentTime;
//   late Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//
//     dbRef = DBHelper.getInstance;
//     getNotes();
//
//
//
//     super.initState();
//     _currentTime = DateTime.now();
//     _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       setState(() {
//         _currentTime = DateTime.now();
//       });
//     });
//   }
//
//   // timer close
//
//
//   // Database start
//   List<Map<String, dynamic>> allNotes = [];
//   DBHelper? dbRef;
//
//
//   void getNotes() async {
//     allNotes = await dbRef!.getAllNotes();
//     if(widget.noteIndex != -1){
//
//       addDataTextField(widget.noteIndex);
//     }
//     setState(() {});
//   }
//
//   // Database close
//
//   @override
//   void dispose() {
//     _timer.cancel(); // Important: cancel the timer when the widgets is disposed
//     super.dispose();
//   } // timer stop
//
//
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController detailsController = TextEditingController();
//
//   void addDataTextField(index) {
//     titleController.text = allNotes[index]["title"];
//     detailsController.text = allNotes[index]["desc"];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomSwitchScreen()));
//           },
//             child: Icon(Icons.arrow_back)
//         ),
//         title: Text(
//             "Note Pad",
//           style: TextStyle(
//             fontSize: 16
//           ),
//         ),
//
//         actions: [
//           // Left arrow button
//           InkWell(splashColor: Colors.transparent,
//             onTap: () {
//
//             },
//             child: Container(
//               margin: EdgeInsets.only(right: 5),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               height: 50,
//               width: 35,
//               child: Icon(Icons.undo_outlined, size: 25,),
//             ),
//           ),
//           // right arrow button
//           InkWell(splashColor: Colors.transparent,
//             onTap: () {
//
//             },
//             child: Container(
//               margin: EdgeInsets.only(right: 5),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               height: 50,
//               width: 35,
//               child: Icon(Icons.redo_outlined, size: 25,),
//             ),
//           ),
//
//           // Save Note data
//           InkWell(
//             overlayColor: WidgetStatePropertyAll(Colors.transparent),
//             onTap: () async{
//
//               var title = titleController.text;
//               var desc = detailsController.text;
//               var createdAt = DateTime.now().millisecondsSinceEpoch;
//
//
//               if (title.isNotEmpty &&
//                   desc.isNotEmpty) {
//                 // Map<String, dynamic> singleNoteMap = {
//                 //   "id": widget.noteIndex != -1 ? widget.noteIndex : NotesData.list.length,
//                 //   "title": titleController.text,
//                 //   "details": detailsController.text,
//                 //   "created_at":  DateTime.now(),
//                 //
//                 // };
//
//
//
//                 if(widget.noteIndex == -1){
//                   // NotesData.list.add(singleNoteMap);
//                   await dbRef!
//                       .addNote(mTitle: title, mDesc: desc,  mCreatedAt: createdAt,);
//                 }else{
//                   // NotesData.list[widget.noteIndex] = singleNoteMap;
//
//                   var sno = allNotes[widget.noteIndex][DBHelper.COLUMN_NOTE_SNO];
//                   await dbRef!.updateNote(
//                       mTitle: title, mDesc: desc, sno: sno, mCreatedAt: createdAt,);
//                 }
//
//               } else {
//                 log("not saved......");
//               }
//
//
//
//
//               Navigator.pop(context);
//
//             },
//             child: Container(
//               margin: EdgeInsets.only(right: 15),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               height: 50,
//               width: 35,
//               child: Icon(Icons.check, size: 30,),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//         child: Container(
//           decoration: BoxDecoration(
//             // color: Colors.green,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           width: double.infinity,
//           height: double.infinity,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // date
//                 ShowRealtimeDateTimeWidget(currentTime: _currentTime),
//
//                 SizedBox(height: 20),
//                 // title
//                 EditorTitleInputFieldWidget(titleController: titleController),
//
//                 // details
//                 EditorDetailsInputFieldWidget(detailsController: detailsController),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
// }
//
//
//
//
//
//
//
//
