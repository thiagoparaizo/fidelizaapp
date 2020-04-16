import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> getCurrentUser();
  Future<FirebaseUser> getGoogleLogin();
  Future getFacebookLogin();

  Future<String> getToken();
  Future getLogOut();
  Future<String> signInEmailPassword(String email, String password);
  Future<String> signUpEmailPassword(String email, String password);
}
