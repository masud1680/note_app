import 'package:flutter/material.dart';

class NoteDisplay extends StatefulWidget {
  const NoteDisplay({super.key});

  @override
  State<NoteDisplay> createState() => _NoteDisplayState();
}

class _NoteDisplayState extends State<NoteDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
          return Card(

            color: Color(0xFFE8DEE6),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // title & date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title

                      Text(
                        "Life system and goals",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),

                      ),
                      Text(
                        "Last edited : 7 Nov, 24",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),

                      ),
                    ],
                  ),

                  // image


                ],
              ),
            ),
          );
        },),
      ),
    );
  }
}
