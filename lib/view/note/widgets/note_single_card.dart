import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/model/note.dart';



class NoteSingleCard extends StatefulWidget {
  const NoteSingleCard({
    super.key, required this.id, required this.whichPage,   required this.note,
  });

  final int? id;
  final String whichPage ;
  final String? note ;

  @override
  State<NoteSingleCard> createState() => _NoteSingleCardState();
}

class _NoteSingleCardState extends State<NoteSingleCard> {

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
          "${widget.note}",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
          maxLines: 1,
        ),

        // subtitle: Text(
        //   "${singleNoteMap["desc"]}",
        //   maxLines: 2,
        // ),

        // trailing: Text(
        //
        //   widget.whichPage == "trashSearch" ? DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(singleNoteMap["deleted_at"]))
        //   : widget.whichPage == "noteSearch" ? DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(singleNoteMap["created_at"]))
        //   : widget.whichPage == "note" ? DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(singleNoteMap["created_at"]))
        //       : widget.whichPage == "trash" ?DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(singleNoteMap["deleted_at"]))
        //   : "",
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        // ),

      ),
    );
  }
}