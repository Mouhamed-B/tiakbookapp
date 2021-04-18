import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/pages/home.dart';

import 'home.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //starTime();
    return MaterialApp(
        home: Scaffold(
            body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                "images/tiakBook.png",
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 150),
                    child: Text(
                      "TIAKBOOK",
                      style: GoogleFonts.pacifico(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            child: LayoutBuilder(
              builder: (context, _) {
                return IconButton(
                  icon: Icon(Icons.play_circle_filled),
                  iconSize: 50.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                );
              },
            ),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    )));
  }
}
