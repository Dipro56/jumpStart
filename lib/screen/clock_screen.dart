import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  TimeOfDay _time = TimeOfDay.now();

  var hour, minute;

  void selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        hour = _time.hour;
        minute = _time.minute;
      });
    }
  }

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
                    onPressed: () {}),
                Container(
                  padding: EdgeInsets.only(left: 90),
                  alignment: Alignment.center,
                  color: Colors.black,
                  height: 40,
                  child: Text("Choose Time",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: Colors.grey,
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                color: Colors.black,
                padding: EdgeInsets.only(top: 200),
                child: Column(
                  children: <Widget>[
                    TextButton(
                        // onPressed: pickDate(),
                        onPressed: selectTime,
                        child: Text(
                          "$_time",
                          style: TextStyle(color: Colors.grey, fontSize: 40),
                        )),
                    SizedBox(
                      height: 300,
                    ),
                    Container(
                      color: Colors.blueAccent.shade700,
                      height: 45,
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClockScreen()),
                            );
                          },
                          child: Text(
                            "NEXT",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    )));
  }
}
