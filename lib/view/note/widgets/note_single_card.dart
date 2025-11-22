import 'package:flutter/material.dart';

import '../../../database/notes_data.dart';

class NoteSingleCard extends StatelessWidget {
  const NoteSingleCard({
    super.key, required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE8DEE6),
      child: ListTile(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
        ),
        tileColor: Colors.green[100],
        title: Text(
          "${NotesData.list[index]["title"]}",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
          maxLines: 1,
        ),
        subtitle: Text(
          "${NotesData.list[index]["details"]}",
          maxLines: 2,
        ),

        trailing: Text(
          "${NotesData.list[index]["created_at"]["shortDate"]}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

      ),
    );
  }
}