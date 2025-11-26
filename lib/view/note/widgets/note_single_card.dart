import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../database/notes_data.dart';

class NoteSingleCard extends StatefulWidget {
  const NoteSingleCard({
    super.key, required this.index, required this.whichPage,   required this.singleNoteMapIn,
  });

  final int index;
  final String whichPage ;
  final Map<String,dynamic> singleNoteMapIn ;

  @override
  State<NoteSingleCard> createState() => _NoteSingleCardState();
}

class _NoteSingleCardState extends State<NoteSingleCard> {
  late Map<String,dynamic> singleNoteMap ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleNoteMap = widget.singleNoteMapIn;
  }
  // late dynamic singleNoteMap = widget.whichPage == "note" ? NotesData.list[widget.index] : NotesData.trashList[widget.index];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
        ),
        tileColor: Colors.white,
        title: Text(
          "${singleNoteMap["title"]}",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
          maxLines: 1,
        ),
        subtitle: Text(
          "${singleNoteMap["desc"]}",
          maxLines: 2,
        ),

        trailing: Text(

          widget.whichPage == "trashSearch" ? DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(singleNoteMap["deleted_at"]))
          : widget.whichPage == "noteSearch" ? DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(singleNoteMap["created_at"]))
          : widget.whichPage == "note" ? DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(singleNoteMap["created_at"]))
              : widget.whichPage == "trash" ?DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(singleNoteMap["deleted_at"]))
          : "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

      ),
    );
  }
}