// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:note_app/database/notes_data.dart';
// import 'package:note_app/view/note_add_edit/note_add_edit.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
//
// import '../../database/local_database.dart';
//
// class NoteDetails extends StatefulWidget {
//   const NoteDetails({
//     super.key,
//     required this.noteIndex,
//     required this.whichPage,
//   });
//
//   final int noteIndex;
//   final String whichPage;
//
//   @override
//   State<NoteDetails> createState() => _NoteDetailsState();
// }
//
// class _NoteDetailsState extends State<NoteDetails> {
//   // Database start
//   List<Map<String, dynamic>> allNotes = [];
//   List<Map<String, dynamic>> allTrashNotes = [];
//   late Map<String, dynamic> singleNoteData ;
//   DBHelper? dbRef;
//
// late bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     dbRef = DBHelper.getInstance;
//     getNotes();
//
//   }
//
//   void getNotes() async {
//     allNotes = await dbRef!.getAllNotes();
//     allTrashNotes = await dbRef!.getAllTRASHNotes();
//
//     singleNoteData = widget.whichPage == "note"
//         ? allNotes[widget.noteIndex]
//         : widget.whichPage == "noteSearch" ? allNotes[widget.noteIndex]
//         : widget.whichPage == "trashSearch" ? allTrashNotes[widget.noteIndex]
//         : allTrashNotes[widget.noteIndex];
//
//     setState(() {});
//     isLoading = true;
//   }
//
//   // Database close
//
//   // get single note data
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//
//         title: Text("Note Pad", style: TextStyle(fontSize: 16)),
//
//         actions: [
//           // Left arrow button
//           InkWell(
//             splashColor: Colors.transparent,
//             onTap: () {},
//             child: Container(
//               margin: EdgeInsets.only(right: 5),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               height: 50,
//               width: 35,
//               child: Icon(Icons.share_outlined, size: 25),
//             ),
//           ),
//           // right arrow button
//           InkWell(
//             splashColor: Colors.transparent,
//             onTap: () {},
//             child: Container(
//               margin: EdgeInsets.only(right: 5),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               height: 50,
//               width: 35,
//               child: Icon(Icons.color_lens_outlined, size: 25),
//             ),
//           ),
//
//           // Save Note data
//           InkWell(
//             splashColor: Colors.transparent,
//             onTap: () {},
//
//             child: Container(
//               margin: EdgeInsets.only(right: 15),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               height: 50,
//               width: 35,
//               child: Icon(Icons.more_vert_outlined, size: 30),
//             ),
//           ),
//         ],
//       ),
//       body: isLoading ? Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//         child: InkWell(
//
//           overlayColor: WidgetStateColor.transparent,
//           onTap: () {
//             if (widget.whichPage == "note") {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => NoteModify(noteIndex: widget.noteIndex),
//                 ),
//               ).then((value) {
//                 setState(() {
//                   getNotes();
//                 });
//               });
//             }
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               // color: Colors.green,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             width: double.infinity,
//             height: double.infinity,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // date time
//                   SizedBox(
//                     width: double.infinity,
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       spacing: 5,
//                       children: [
//                         Text(
//                           "Date: ${widget.whichPage == "note" ? DateFormat('dd/MM/yyy').format(DateTime.fromMillisecondsSinceEpoch(singleNoteData["created_at"] ?? -1)) : DateFormat('dd/MM/yyy').format(DateTime.fromMillisecondsSinceEpoch(singleNoteData["deleted_at"] ?? -1))}",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Text(
//                           "Time: ${widget.whichPage == "note" ? DateFormat('KK:mm a').format(DateTime.fromMillisecondsSinceEpoch(singleNoteData["created_at"] ?? -1)) : DateFormat('KK:mm a').format(DateTime.fromMillisecondsSinceEpoch(singleNoteData["deleted_at"] ?? -1)) }",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 20),
//                   // title
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "${singleNoteData["title"]}",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//
//                   // details
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "${singleNoteData["desc"]}",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ) : Center(
//         child: Text("Notes Loading"),
//       )
//     );
//   }
// }
