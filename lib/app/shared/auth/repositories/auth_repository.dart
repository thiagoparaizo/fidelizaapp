import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth get _auth => FirebaseAuth.instance;
  FirebaseUser usuarioLoado;

  @override
  Future getFacebookLogin() {
    // TODO: implement getFacebookLogin
    return null;
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    return null;
  }

  @override
  Future<FirebaseUser> getUser() async {
    print('getUser');
    return await FirebaseAuth.instance.currentUser();
  }

  @override
  Future getLogOut() {
    return _auth.signOut();
  }

  @override
  Future<FirebaseUser> getCurrentUser() async {
    if (this.usuarioLoado != null) {
      return this.usuarioLoado;
    } else {
      FirebaseUser user = await _auth.currentUser();
      this.usuarioLoado = user;
      return user;
    }
  }

  @override
  Future<String> signInEmailPassword(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  @override
  Future<String> signUpEmailPassword(String email, String password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }
}
