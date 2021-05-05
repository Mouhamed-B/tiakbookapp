import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiakbookapp/src/screens/client_signup.dart';
import 'package:tiakbookapp/src/screens/deliverer_signup.dart';
import 'package:tiakbookapp/src/screens/error_screen.dart';
import 'package:tiakbookapp/src/screens/explorer.dart';
import 'package:tiakbookapp/src/screens/home.dart';
import 'package:tiakbookapp/src/screens/splashscreen_page.dart';

class Wrapper extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  Future<void> tryAnonymousSignin() async {
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: tryAnonymousSignin(),
        builder: (context, snapshot) {
          //auth failure
          if (snapshot.hasError) {
            return ErrorScreen();
          }

          //auth success
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<User?>(
              create: (_) => _auth.authStateChanges(),
              initialData: (_auth.currentUser)!,
              child: Column(
                children: [Home(), DelivererSignup(), ClientSignup()],
              ),
              builder: (context, child) {
                return MaterialApp(
                    home: (!_auth.currentUser!.isAnonymous)
                        ? Explorer()
                        : Home());
              },
            );
          }
          //in auth process
          return SplashScreenPage();
        });
  }
}
