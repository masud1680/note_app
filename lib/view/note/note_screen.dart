import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD1AD9F),
      appBar: AppBar(
        backgroundColor: Color(0xFF795545),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,

            child: Icon(
                Icons.keyboard_backspace_outlined,
              size: 20,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            width: 250,
            child: Center(
              child: Text(
                "বিচার দিবস",
                style: TextStyle(
                  color: Color(0xFF795545),
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),

          width: double.infinity,
          height: 250,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF795545),
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(9),
                    topEnd: Radius.circular(9)
                  )
                ),
                height: 50,
                width: double.infinity,
                child: Row(
                  spacing: 20,
                  children: [
                    //serial post number
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusGeometry.directional(
                          topEnd: Radius.circular(20),
                          bottomEnd: Radius.circular(20)
                        )
                      ),
                      width: 50,
                      height: 36,
                      child: Center(
                        child: Text(
                          "১",
                          style: TextStyle(
                            color: Color(0xFF795545),
                            fontWeight: FontWeight.w600,
                            fontSize: 25
                          ),
                        ),
                      ),
                    ),
                    // title text
                    Text(
                      "বিচার দিবস",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
