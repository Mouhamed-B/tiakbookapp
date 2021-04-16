import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/main.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("network_error.jpg"),
          Text(
              "Réseau indisponible\nVeuillez vérifier votre connexion internet",
              style: TextStyle(
                color: Colors.grey[350],
                fontSize: 15,
              ))
        ],
      )),
    );
  }
}
