import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled2/wallpaper.dart';



class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(()async =>await Navigator.pushReplacement<Future,dynamic>(context, MaterialPageRoute<Future>(builder: (context)=>wallpaper()))));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wall',
                  style: TextStyle(
                      color: Colors.white, fontSize: 40),
                ),
                Text(
                  'Paper',
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 100, 247), fontSize: 50),
                ),
              ],
            ),
          )),
    );
  }
}
