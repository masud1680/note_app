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

            child: Icon(Icons.keyboard_backspace_outlined, size: 25),
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
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFFF3D7CC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),

            width: double.infinity,
            height: 250,
            child: Column(
              children: [
                // card top bar
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF795545),
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(9),
                      topEnd: Radius.circular(9),
                    ),
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
                            bottomEnd: Radius.circular(20),
                          ),
                        ),
                        width: 50,
                        height: 36,
                        child: Center(
                          child: Text(
                            "১",
                            style: TextStyle(
                              color: Color(0xFF795545),
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      // title text
                      Text(
                        "বিচার দিবস",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // card body
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFEED5CE),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFD1AD9F),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  height: 120,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "অন্যের জীবন নষ্ট করা মানুষগুলো অন্যায় করার সময় ভুলে যায় বিচারদিবসের মালিকের কথা!",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                //bottom buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //copy button
                      CircleAvatar(
                        backgroundColor: Color(0xFF795545),
                        maxRadius: 20,
                        child: Center(
                          child: Icon(Icons.copy, color: Colors.white),
                        ),
                      ),

                      // sear button
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xFF795545),
                          ),
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Icon(Icons.share, color: Colors.white, size: 20),
                            Text(
                              "শেয়ার করুন...",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        )
      ),
    );
  }
}
