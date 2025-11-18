import 'package:flutter/material.dart';

class NoteModify extends StatefulWidget {
  const NoteModify({super.key});

  @override
  State<NoteModify> createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Note Modify"),),
    );
  }
}
