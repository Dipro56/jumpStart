import 'package:flutter/material.dart';

import '../main.dart';

class ExtraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                IconButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    }),
                Container(
                  padding: EdgeInsets.only(left: 130),
                  alignment: Alignment.center,
                  color: Colors.black,
                  height: 40,
                  child: Text("Extras",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: .5,
            child: Container(
              color: Colors.grey,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            color: Colors.grey.shade900,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text("SHARE THIS APP",
                style:
                    TextStyle(color: Colors.blueAccent.shade700, fontSize: 15)),
          ),
          SizedBox(
            height: .5,
            child: Container(
              color: Colors.grey,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            color: Colors.grey.shade900,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text("TERMS & CONDITIONS",
                style:
                    TextStyle(color: Colors.blueAccent.shade700, fontSize: 15)),
          ),
        ],
      ),
    )));
  }
}
