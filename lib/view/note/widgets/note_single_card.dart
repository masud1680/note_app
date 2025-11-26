import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../database/notes_data.dart';

class NoteSingleCard extends StatefulWidget {
  const NoteSingleCard({
    super.key, required this.index, required this.whichPage,   required this.singleNoteMap,
  });

  final int index;
  final String whichPage ;
  final Map<String,dynamic> singleNoteMap;



  @override
  State<NoteSingleCard> createState() => _NoteSingleCardState();
}

class _NoteSingleCardState extends State<NoteSingleCard> {

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
          "${widget.singleNoteMap["title"]}",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
          maxLines: 1,
        ),
        subtitle: Text(
          "${widget.singleNoteMap["desc"]}",
          maxLines: 2,
        ),

        trailing: Text(

          widget.whichPage == "trashSearch" ? DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(widget.singleNoteMap["deleted_at"]))
          : widget.whichPage == "noteSearch" ? DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(widget.singleNoteMap["created_at"]))
          : widget.whichPage == "note" ? DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(widget.singleNoteMap["created_at"]))
              : widget.whichPage == "trash" ?DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(widget.singleNoteMap["deleted_at"]))
          : "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

      ),
    );
  }
}