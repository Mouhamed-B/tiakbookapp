import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/pages/delivery_page.dart';
import 'package:tiakbookapp/src/pages/error_screen.dart';
import 'package:tiakbookapp/src/pages/signin_page.dart';
import 'package:tiakbookapp/src/pages/splashscreen_page.dart';
import 'package:tiakbookapp/src/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  MediaQueryData of(BuildContext context) {
    assert(context != null);
    assert(debugCheckHasMediaQuery(context));
    return context.dependOnInheritedWidgetOfExactType<MediaQuery>()!.data;
  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: App(),
  ));
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
              home: Home(),
              debugShowCheckedModeBanner: false,
              routes: {'home': (context) => Home()});
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Choose inscription"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 200, right: 20, left: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Livreur()));
                            },
                            child: Text("S'inscrire en tant que Livreur",
                                style: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: 300,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Professionnel()));
                            },
                            child: Text("S'inscrire en tant que Professionel",
                                style: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
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
