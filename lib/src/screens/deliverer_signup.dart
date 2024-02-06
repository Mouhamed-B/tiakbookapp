import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/models/deliverer.dart';
import 'package:tiakbookapp/src/screens/explorer.dart';
import 'package:tiakbookapp/src/screens/signup_menu.dart';
import 'package:tiakbookapp/src/services/auth_service.dart';
import 'package:tiakbookapp/src/services/deliverer_service.dart';

//professionnel inscription  class
class DelivererSignup extends StatefulWidget {
  @override
  _DelivererSignupState createState() => _DelivererSignupState();
}

//fonction de verification de saisie

class _DelivererSignupState extends State<DelivererSignup> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var auth = AuthService();
  var delService = DelivererService();
  int choice = 0;
  List listItem = [
    'Motocycliste',
    'poids lourds',
    'vehicule particulier',
  ];
  static Route<Object?> _successDialog(
      BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
          title: Text('Inscription effectuée avec succès'),
          content: Icon(
            Icons.check,
            color: Colors.green,
          )),
    );
  }

  static Route<Object?> _errorDialog(BuildContext context, Object? arguments) {
    return DialogRoute<void>(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
            title: Text('Erreur réseau : veuillez vérifier votre connexion'),
            content: Icon(
              Icons.error_outline,
              color: Colors.red,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: (AppBar(title: Center(child: Text("Inscription ")))),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/images/contact.png",
                        height: 100.0, width: 100.0),
                    Text(
                      'Création d\' un compte Livreur',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Nom', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre nom' : null,
                      controller: lastNameController,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Prénom', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre prénom' : null,
                      controller: firstNameController,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Téléphone', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre numéro' : null,
                      controller: phoneNumberController,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email ', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre email' : null,
                      controller: emailController,
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
                      controller: passwordController,
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: DropdownButton(
                            hint: Text('Type de véhicule'),
                            //dropdownColor: Colors.blue,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            value: choice,
                            onChanged: (dynamic newValue) {
                              setState(() {
                                choice = newValue;
                              });
                            },
                            items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: listItem.indexOf(valueItem),
                                child: Text(valueItem),
                              );
                            }).toList()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            await auth
                                .signup(emailController.text,
                                    passwordController.text)
                                .then((status) async {
                              if (status.state) {
                                var d = Deliverer(
                                    id: FirebaseAuth.instance.currentUser!.uid,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    created: Timestamp.fromDate(DateTime.now()),
                                    isAvailable: false,
                                    phoneNumber: phoneNumberController.text,
                                    vehicleType: choice);
                                await delService.addDeliverer(d).then((eta) {
                                  if (eta) {
                                    Navigator.of(context).restorablePush(
                                        (context, arguments) =>
                                            _successDialog(context, arguments));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Explorer()));
                                  } else {
                                    SnackBar(content: Text("Echec"));
                                  }
                                });
                              }
                            });
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
                      padding: const EdgeInsets.all(16.0),
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupMenu()));
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
        );
  }
}
