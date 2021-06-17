import 'package:flutter/material.dart';
import 'package:jump_start/screen/clock_screen.dart';

import '../main.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime pickedDate;
  String initial = "MMM DD, YYYY", setEndDATA = "SET END DATA";
  bool firstDate = false, customRangeStart = false, customRangeEnd = false;

  var monthName = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  var startCustomDate,
      yearStart,
      monthStart,
      dayStart,
      endCustomDate,
      yearEnd,
      monthEnd,
      dayEnd;

  getStartCustomDate() async {
    DateTime startDateCustom = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20));
    setState(() {
      String month = monthName[startDateCustom.month - 1];
      startCustomDate =
          "$month ${startDateCustom.day}, ${startDateCustom.year}";
      customRangeStart = true;

      print(startDateCustom);
      print(DateTime(DateTime.now().year));
      yearStart = startDateCustom.year;
      monthStart = startDateCustom.month;
      dayStart = startDateCustom.day;
    });
  }

  getEndCustomDate() async {
    DateTime endDateCustom = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20));
    setState(() {
      String endMonth = monthName[endDateCustom.month - 1];
      endCustomDate = "$endMonth ${endDateCustom.day}, ${endDateCustom.year}";
      customRangeEnd = true;
      print(endCustomDate);
      yearEnd = endDateCustom.year;
      monthEnd = endDateCustom.month;
      dayEnd = endDateCustom.day;
    });
  }

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
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
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    }),
                Container(
                  padding: EdgeInsets.only(left: 110),
                  alignment: Alignment.center,
                  color: Colors.black,
                  height: 40,
                  child: Text("PROJECT",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            color: Colors.black,
            alignment: Alignment.centerLeft,
            child: Text("CRUSH THIS PROJECT BY:",
                style: TextStyle(color: Colors.grey, fontSize: 15)),
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
                padding: EdgeInsets.only(top: 250),
                child: Column(
                  children: <Widget>[
                    if (!customRangeStart)
                      TextButton(
                          // onPressed: pickDate(),
                          onPressed: getStartCustomDate,
                          child: Text(
                            "$initial",
                            style: TextStyle(color: Colors.grey, fontSize: 40),
                          ))
                    else if (customRangeStart)
                      TextButton(
                          //onPressed: pickDate(),
                          onPressed: getStartCustomDate,
                          child: Text(
                            "$startCustomDate",
                            style: TextStyle(color: Colors.grey, fontSize: 40),
                          )),
                    if (!customRangeEnd)
                      TextButton(
                          onPressed: getEndCustomDate,
                          child: Text(
                            "$setEndDATA",
                            style: TextStyle(
                                color: Colors.blue.shade200, fontSize: 13),
                          ))
                    else if (customRangeEnd)
                      TextButton(
                          onPressed: getEndCustomDate,
                          child: Text(
                            "$endCustomDate",
                            style: TextStyle(
                                color: Colors.blue.shade200, fontSize: 13),
                          )),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      color: Colors.grey.shade900,
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Text("NO END DATE",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ),
                    SizedBox(
                      height: 10,
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
