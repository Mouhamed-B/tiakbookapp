import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/models/client.dart';
import 'package:tiakbookapp/src/services/auth_service.dart';
import 'package:tiakbookapp/src/services/client_service.dart';
import 'package:provider/provider.dart';
import 'package:tiakbookapp/src/utils/status.dart';

//driver inscription class
class ClientSignup extends StatefulWidget {
  @override
  _ClientSignupState createState() => _ClientSignupState();
}

class _ClientSignupState extends State<ClientSignup> {
  var auth = AuthService();
  var clientService = ClientService();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController adressController = TextEditingController();
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
                    Image.asset("assets/images/telecharger.jpg",
                        height: 100.0, width: 100.0),
                    Text(
                      'Création d\' un compte Professionnel',
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
                          labelText: 'Email', border: OutlineInputBorder()),
                      validator: (val) =>
                          val!.isEmpty ? 'Entrez votre adresse' : null,
                      controller: adressController,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            Status status = await auth.signup(
                                emailController.text, passwordController.text);
                            if (status.state) {
                              var c = Client(
                                  id: context.read<User>().uid,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  created: DateTime.now(),
                                  phoneNumber: phoneNumberController.text,
                                  adresses: [adressController.text]);
                              clientService.addClient(c);
                            }
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
