import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/screens/explorer.dart';
import 'package:tiakbookapp/src/screens/signup_menu.dart';
import 'package:tiakbookapp/src/services/auth_service.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var authService = AuthService();
  static Route<Object?> _successDialog(
      BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
          title: Text('Connexion effectuée avec succès'),
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
      appBar: AppBar(
        title: Center(child: Text("Se Connecter")),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("assets/images/telecharger.jpg",
                    height: 100.0, width: 100.0),
                SizedBox(height: 10.0),
                Text('Veuillez remplir les champs pour vous connecter',
                    style: GoogleFonts.raleway(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Téléphone/Email',
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'Entrez votre email' : null,
                  controller: _emailController,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Mot de passe', border: OutlineInputBorder()),
                  validator: (val) => val!.length < 6
                      ? 'Entrez mot de passe avec 6 ou plusieurs caracteres'
                      : null,
                  controller: _passwordController,
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await authService
                          .signin(
                              _emailController.text, _passwordController.text)
                          .then((status) {
                        if (status.state) {
                          Navigator.of(context).restorablePush(
                              (context, arguments) =>
                                  _successDialog(context, arguments));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Explorer()));
                        } else {
                          SnackBar(
                            content: Text(status.message),
                          );
                        }
                      });
                    },
                    child: Text(
                      'Se Connecter',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 100),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MotDePasse()));
                    },
                    child: Text(
                      'Mot de passe oublié',
                      style: GoogleFonts.raleway(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 100),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupMenu()));
                    },
                    child: Text(
                      'S\'inscrire',
                      style: GoogleFonts.raleway(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
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

class MotDePasse extends StatefulWidget {
  @override
  _MotDePasseState createState() => _MotDePasseState();
}

class _MotDePasseState extends State<MotDePasse> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Créer un nouveau mot de passe',
                          style: GoogleFonts.raleway(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Téléphone/Email',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(height: 10.0),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Nouveau mot de passe',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Confirmer le mot de passe',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'valider',
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
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
