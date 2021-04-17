import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/main.dart';
import 'package:tiakbookapp/src/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var message =
      "Une plateforme de livraison facile fiable rapide sans deplacement";
  FirebaseAuth auth = FirebaseAuth.instance;
  // ignore: cancel_subscriptions
  @override
  void initState() {
    if (auth.currentUser == null) {
      auth.signInAnonymously();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(
                          child: Image.asset(
                            "images/tiakBook.png",
                            width: MediaQuery.of(context).size.width * .5,
                            height: MediaQuery.of(context).size.height * .5,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          message,
                          style: GoogleFonts.raleway(
                              fontSize: 25,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactLivreur()));
                        },
                        child: Text(
                          "Contactez un livreur",
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Connexion()));
                        },
                        child: Text(
                          "Se connecter",
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InscriptionType()));
                        },
                        child: Text(
                          "S'inscrire",
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
