import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/model/user_data_model.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //email and password register method is used to create a new user and if any reason the user authentication fails it return the error code
  Future<dynamic> registerAccount(String email, String password) async {
    try {
      
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      
      final User? user = credential.user;
      
      if (user != null) {
        return UserDataModel(
            uid: user.uid, email: user.email);
      }
    } on FirebaseAuthException catch (e) {
      //if the try get any exception we handling with some error code
      if (e.code == 'weak-password') {
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        return 'email-already-in-use';
      } else if (e.code == 'invalid-email') {
        return 'invalid-email';
      }
    } catch (e) {
      //if the exception is not FirebaseAuthException we return that exception
      return e;
    }
  }

}