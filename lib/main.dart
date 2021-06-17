import 'package:flutter/material.dart';
import 'package:jump_start/screen/extra_screen.dart';

import 'screen/calendar_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      home: SafeArea(
          child: Scaffold(
              body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              width: double.infinity,
              alignment: Alignment.center,
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 140),
                    alignment: Alignment.center,
                    color: Colors.black,
                    height: 40,
                    child: Text("Jump Start ",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(
                        Icons.settings,
                        color: Colors.blueAccent.shade400,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExtraScreen()),
                        );
                      })
                ],
              ),
            ),
            Container(
              color: Colors.blueAccent.shade400,
              width: double.infinity,
              alignment: Alignment.center,
              height: 100,
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              alignment: Alignment.center,
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    color: Colors.black,
                    height: 40,
                    child: Text("ADD NEW ALARM",
                        style: TextStyle(
                            color: Colors.blueAccent.shade400, fontSize: 25)),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.blueAccent.shade400,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalendarScreen()),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
