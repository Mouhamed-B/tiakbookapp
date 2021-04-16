import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/pages/delivery_page.dart';
import 'package:tiakbookapp/src/widgets/error_screen.dart';
import 'package:tiakbookapp/src/widgets/inscription.dart';
import 'package:tiakbookapp/src/pages/splashscreen_page.dart';
import 'package:tiakbookapp/src/pages/acceuil.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              theme: ThemeData(
                  brightness: Brightness.light,
                  primaryColor: Colors.blue,
                  accentColor: Colors.white),
              home: Acceuil(),
              debugShowCheckedModeBanner: false,
              routes: {'home': (context) => Acceuil()});
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return SplashScreenPage();
      },
    );
  }
}
// ignore: must_be_immutable

//class contact driver
class ContactLivreur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.white,
      ),
      home: SaisieContact(),
    );
  }
}

//class inscription to choose type
class InscriptionType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 200, right: 20, left: 20),
                    child: SizedBox(
                      height: 70,
                      width: 300,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Livreur()));
                          },
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Text("S'inscrire en tant que livreur",
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: SizedBox(
                      height: 70,
                      width: 300,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Professionnel()));
                          },
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Text("S'inscrire en tant que Professionel",
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//class for driver go to inscription
class Livreur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.white,
      ),
      home: InscriptionLivreur(),
    );
  }
}

//class for professionnel go to inscription
class Professionnel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.white,
      ),
      home: InscriptionProfessionnel(),
    );
  }
}
