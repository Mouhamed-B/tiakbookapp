import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/main.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MK Splash Screen")),
      body: Center(
          child: Text("Bienvenue sur \n MK Solutions",
              style: TextStyle(color: Colors.black, fontSize: 30))),
    );
  }
}
