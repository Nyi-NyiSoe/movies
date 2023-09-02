import 'package:firebase_auth/firebase_auth.dart';

import 'package:movies/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  //sign in email/pass
  Future loginWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? myUser = result.user;
      return _userFromFirebase(myUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register email/pass
  Future registerWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? myUser = result.user;
      return _userFromFirebase(myUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout

  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}
