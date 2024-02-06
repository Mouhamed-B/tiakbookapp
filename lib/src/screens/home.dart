import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/screens/explorer.dart';
import 'package:tiakbookapp/src/screens/login_page.dart';
import 'package:tiakbookapp/src/screens/signup_menu.dart';
import 'package:tiakbookapp/src/utils/mediaqueries.dart';

class Home extends StatelessWidget {
  final message =
      "Une plateforme de livraison facile fiable rapide sans deplacement";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: vh(context, .03),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Container(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                              child: Image.asset("assets/images/textlogo.png",
                                  width:
                                      MediaQuery.of(context).size.width * .6)),
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/images/order.jpg",
                            width: 400,
                            height: 250,
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Explorer()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  "Continuer sans compte",
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Connexion()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  "Se connecter",
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupMenu()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  "S'inscrire",
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
