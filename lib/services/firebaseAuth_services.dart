import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/model/register_errors_model.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //email and password register method is used to create a new user and if any reason the user authentication fails it return the error code
  Future<dynamic> registerAccount(String email, String password,RegisterErrorsModel  registerError) async {
    try {
      
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //if the try get any exception we handling with some error code
      if (e.code == 'weak-password') {
        registerError.passwordError = 'weak-password';
     
      } else if (e.code == 'email-already-in-use') {
        registerError.emailError = 'email-already-in-use';
      
      } else if (e.code == 'invalid-email') {
        registerError.emailError = 'invalid-email';
        
      }
    } catch (e) {
      //if the exception is not FirebaseAuthException we return that exception
      return e;
    }
    return registerError;
  }


  //if the user have already an account in with email and password method it help to sign in
  Future<dynamic> logInAccount(String email, String password,RegisterErrorsModel  loginErrors) async {
    try {
      
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //if the try get any exception we handling with some error code
      if (e.code == 'wrong-password') {
        print('wrong-password');
        loginErrors.passwordError = 'wrong-password';
      } else if (e.code == 'invalid-email') {
        print('invalid-email');
        loginErrors.emailError = 'invalid-email';
        
      } else if (e.code == 'user-not-found') {
        print('user-not-found');
        loginErrors.emailError = 'user-not-found';
      }
    } catch (e) {
      //if the exception is not FirebaseAuthException we return that exception
      return e;
    }
    return loginErrors;
  }
  

  //for if the user forgot his password that time user can reset his password with this method it send a link to his mail
  void resetPassword(String email) async {
    try {
      _firebaseAuth.sendPasswordResetEmail(email: email).then((dskjm){
         print('sucesss');
      }).catchError((error){
         print(error);
      });
    } catch (e) {
      print(e);
    }
    
  }

}