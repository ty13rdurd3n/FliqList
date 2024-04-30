import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> userSignUp(
      {required String email, required String password}) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (error) {
      if (error.code == "Weak-Password") {
        return "Weak Password";
      } else if (error.code == "email-already-in-use") {
        return "An Account Already Exists For That Email";
      } else {
        return error.message;
      }
    } catch (error) {
      return error.toString();
    }
  }

  Future<String?> userLogin(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        return 'User Not Found';
      } else if (error.code == 'wrong-password') {
        return 'Incorrect Password';
      } else {
        return error.message;
      }
    } catch (error) {
      return error.toString();
    }
  }
}
