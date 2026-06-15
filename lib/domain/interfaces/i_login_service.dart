import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginService {
  Future<User?> signInWithLoginPassword(String login, String password);
  Future<User?> registerWithLoginPassword(String login, String password);
  Future<void> signOut();
}
