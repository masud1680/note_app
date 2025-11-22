import 'package:flutter/material.dart';

class EditorTitleInputFieldWidget extends StatelessWidget {
  const EditorTitleInputFieldWidget({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: titleController,
        maxLines: 5,
        minLines: 1,
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          hintText: "Title",

          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),

          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}