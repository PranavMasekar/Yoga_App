import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/screens/areyouready.dart';
import 'package:yoga_app/screens/break.dart';

class WorkOut extends StatelessWidget {
  const WorkOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>(
      create: (context) => TimerModelSec(context),
      child: Scaffold(
          body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80"),
              ),
            ),
          ),
          Spacer(),
          Text(
            "Anulom Vilom",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 30
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 80),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "00",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " : ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Consumer<TimerModelSec>(
                  builder: (context, myModel, child) {
                    return Text(
                      myModel.countdown.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                "PAUSE",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "PREVIOUS",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("NEXT", style: TextStyle(fontSize: 16)))
              ],
            ),
          ),
          Divider(
            thickness: 2,
            endIndent: 15,
            indent: 15,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text("Next: Anulom Vilom",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      )),
    );
  }
}

class TimerModelSec with ChangeNotifier {
  TimerModelSec(context) {
    MyTimerSec(context);
  }
  int countdown = 30;

  MyTimerSec(context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BreakTime()));
      }
    });
  }
}