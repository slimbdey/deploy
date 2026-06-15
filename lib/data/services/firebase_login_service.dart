import 'package:firebase_auth/firebase_auth.dart';
import 'package:hw/data/repositories/network_checker.dart';
import 'package:hw/domain/interfaces/i_login_service.dart';
import 'package:hw/presentation/bloc/auth/utils.dart';

class FirebaseLoginService extends NetworkChecker implements ILoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void checkNetwork() {
    if (isOffline) {
      throw AuthValidationError.noInternet;
    }
  }

  @override
  Future<User?> signInWithLoginPassword(String login, String password) async {
    checkNetwork();

    final credential = await _auth.signInWithEmailAndPassword(
        email: login.trim(), password: password.trim());
    return credential.user;
  }

  @override
  Future<User?> registerWithLoginPassword(String login, String password) async {
    checkNetwork();

    final credential = await _auth.createUserWithEmailAndPassword(
        email: login.trim(), password: password.trim());
    return credential.user;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
