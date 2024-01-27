import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiakbookapp/src/utils/status.dart';

class AuthService {
  Future<Status> signin(String email, String passwd) async {
    var status;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passwd);
      status = Status.success(state: true, message: "Inscription Reussie");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        status = Status.error(
            state: false, message: 'Cet Utilisateur n\'existe pas', e: e);
      } else if (e.code == 'wrong-password') {
        status =
            Status.error(state: false, message: 'Mot de passe érroné', e: e);
      }
    }
    return status;
  }

  Future<Status> signup(String email, String passwd) async {
    var status;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: passwd);
      status = Status.success(state: true, message: "Inscription Reussie");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        status =
            Status.error(state: false, message: 'Mot de passe faible', e: e);
      } else if (e.code == 'email-already-in-use') {
        status = Status.error(
            state: false, message: 'Cet email est déjà utilisé', e: e);
      }
    }
    return status;
  }
}
