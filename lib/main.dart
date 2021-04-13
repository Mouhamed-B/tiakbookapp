import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/widgets/error_screen.dart';
import 'package:tiakbookapp/src/widgets/inscription.dart';
import 'package:tiakbookapp/src/widgets/splashscreen_page.dart';
import 'package:tiakbookapp/src/widgets/acceuil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    //initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return ErrorScreen();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return SplashScreenPage();
    }
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue,
            accentColor: Colors.white),
        home: SplashScreenPage(),
        debugShowCheckedModeBanner: false,
        routes: {'home': (context) => Acceuil()});
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

class SaisieContact extends StatefulWidget {
  @override
  _SaisieContactState createState() => _SaisieContactState();
}

class _SaisieContactState extends State<SaisieContact> {
  String numeroDestinataire = '';
  String lieuExpedition = '';
  String descriptionColie = '';
  String lieuDeRecup = '';
  String modeDePaiement = '';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "images/livraison.png",
                  height: 100.0,
                  width: 100.0,
                ),
                Text(
                  'Veuiller remplir le formulaire pour contacter un livreur',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Numero destinataire/expediteur',
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'Entrez le numero du destinataire' : null,
                  onChanged: (val) => numeroDestinataire = val,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Lieu d\'expedition',
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'Entrez le lieu d\'expedition' : null,
                  onChanged: (val) => lieuExpedition = val,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Description du Colis',
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'expliquez le contenue du colis' : null,
                  onChanged: (val) => descriptionColie = val,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Lieu de recupération',
                      border: OutlineInputBorder()),
                  validator: (val) => val!.isEmpty
                      ? 'Entrez le lieu de recuperation du colis'
                      : null,
                  onChanged: (val) => lieuDeRecup = val,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Mode de paiement',
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'choisir le mode de paiement' : null,
                  onChanged: (val) => modeDePaiement = val,
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FlatButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        //TODO logical sequences
                        //
                      }
                    },
                    color: Colors.blue,
                    child: Text(
                      'Contactez un livreur',
                      style: GoogleFonts.pacifico(
                          color: Colors.white, fontSize: 22),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
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
