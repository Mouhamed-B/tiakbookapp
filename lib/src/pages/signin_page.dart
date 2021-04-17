import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/main.dart';

//driver inscription class
class InscriptionLivreur extends StatefulWidget {
  @override
  _InscriptionLivreurState createState() => _InscriptionLivreurState();
}

//fonction de verification de saisie

class _InscriptionLivreurState extends State<InscriptionLivreur> {
  final _formkey = GlobalKey<FormState>();
  String nom = '';
  String prenom = '';
  String telephone = '';
  String email = '';
  String password = '';
  String confirmPwd = '';
  String? valueChoose;
  List listItem = [
    'Motocycliste',
    'vehicules poids lourds',
    'vehicules poids legers',
    'Autres'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: (AppBar(title: Center(child: Text("Inscription ")))),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("images/contact.png",
                        height: 100.0, width: 100.0),
                    Text(
                      'Création d\' un compte Livreur',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Nom', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre nom' : null,
                      onChanged: (val) => nom = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Prénom', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre prénom' : null,
                      onChanged: (val) => prenom = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Téléphone', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre numéro' : null,
                      onChanged: (val) => telephone = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email ', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre email' : null,
                      onChanged: (val) => email = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          border: OutlineInputBorder()),
                      validator: (val) => val!.length < 6
                          ? 'Entrez mot de passe avec 6 ou plusieurs caracteres'
                          : null,
                      onChanged: (val) => password = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Confirmez le mot de passe',
                          border: OutlineInputBorder()),
                      onChanged: (val) => confirmPwd = val,
                      validator: (val) => confirmPwd != password
                          ? 'le mot de passe ne correspond pas'
                          : null,
                    ),
                    // ignore: missing_required_param
                    SizedBox(height: 10.0),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: DropdownButton(
                            hint: Text('choisir un type de véhicules'),
                            //dropdownColor: Colors.blue,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            value: valueChoose,
                            onChanged: (dynamic newValue) {
                              setState(() {
                                valueChoose = newValue;
                              });
                            },
                            items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            //TODO logical sequences
                            //
                          }
                        },
                        child: Text(
                          'S\'inscrire',
                          style: GoogleFonts.pacifico(
                              color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InscriptionType()));
                          },
                          child: Text(
                            'Besoin d\'un nouveau compte',
                            style: GoogleFonts.pacifico(
                                color: Colors.blue, fontSize: 22),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

//professionnel inscription  class
class InscriptionProfessionnel extends StatefulWidget {
  @override
  _InscriptionProfessionnelState createState() =>
      _InscriptionProfessionnelState();
}

class _InscriptionProfessionnelState extends State<InscriptionProfessionnel> {
  String nom = '';
  String prenom = '';
  String telephone = '';
  String email = '';
  String domainPro = '';
  String password = '';
  String confirmPwd = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("images/telecharger.jpg",
                        height: 100.0, width: 100.0),
                    Text(
                      'Création d\' un compte Professionnel',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Nom', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre nom' : null,
                      onChanged: (val) => nom = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Prénom', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre prénom' : null,
                      onChanged: (val) => prenom = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Téléphone', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre numéro' : null,
                      onChanged: (val) => telephone = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre email' : null,
                      onChanged: (val) => email = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Domaines professionels',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          border: OutlineInputBorder()),
                      validator: (val) => val!.length < 6
                          ? 'Entrez mot de passe avec 6 ou plusieurs caracteres'
                          : null,
                      onChanged: (val) => password = val,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Confirmez le mot de passe',
                          border: OutlineInputBorder()),
                      onChanged: (val) => confirmPwd = val,
                      validator: (val) => confirmPwd != password
                          ? 'le mot de passe ne correspond pas'
                          : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            //TODO logical sequences
                            //
                          }
                        },
                        child: Text(
                          'S\'inscrire',
                          style: GoogleFonts.pacifico(
                              color: Colors.white, fontSize: 22),
                        ),
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
