import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tiakbookapp/src/Wrapper.dart';
import 'package:tiakbookapp/src/screens/error_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiakbookapp/src/screens/splashscreen_page.dart';

void main() {
  //await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: App()));
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
          return Wrapper();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return SplashScreenPage();
      },
    );
  }
}
