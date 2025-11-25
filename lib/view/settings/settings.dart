import 'package:flutter/material.dart';
import 'package:note_app/view/authentication/signIn_screen.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(backgroundColor: Color(0xFFF5F5F5)),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          spacing: 80,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF5F5F5),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
              ),
              width: double.infinity,
              height: 150,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 15,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sync to Cloud",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      spacing: 2,
                      children: [
                        Text(
                          "Enable",
                          style: TextStyle(
                            color: Color(0xFF9F9FA9),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(Icons.navigate_next,color: Color(0xFF9F9FA9),)
                      ],
                    )
                  ],
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Note Watermark",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.toggle_off,
                        color: Color(0xFF9F9FA9),
                        size: 50,
                      )
                    ],
                  ),

                ],
              ),
            ),

            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red,),

                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 80,vertical: 10),)
              ),
              onPressed: () {
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
            },
              child: Text(
              "Logout",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
