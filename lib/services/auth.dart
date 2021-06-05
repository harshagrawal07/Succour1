import 'package:firebase_auth/firebase_auth.dart';
import 'package:succour/models/UserId.dart';

class AuthMethods{

  UserId _userFromFirebaseUser(User user) {
    return user != null ? UserId(uid: user.uid) : null;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential  result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential  result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}