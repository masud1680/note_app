import 'package:flutter/material.dart';

class EditorDetailsInputFieldWidget extends StatelessWidget {
  const EditorDetailsInputFieldWidget({
    super.key,
    required this.detailsController,
  });

  final TextEditingController detailsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: detailsController,
        maxLines: 1000,
        decoration: InputDecoration(
          hintText: "Details....",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}