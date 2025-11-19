import 'package:flutter/material.dart';

class NoteDetails extends StatelessWidget {
  const NoteDetails({
    super.key,
    required this.title,
    required this.details,
    required this.created_at,
  });
  final String title;
  final String details;
  final String created_at;

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
                      "${created_at}",
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
                    "${title}",
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
                    "${details}",
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
    );
  }
}
