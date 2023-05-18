import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  AuthProvider() {
    _user = _auth.currentUser;
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  User? get user => _user;

  get authStateChanges => _onAuthStateChanged(_auth.currentUser);

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    _user = firebaseUser;
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = result.user;
    } catch (error) {
      if (kDebugMode) {
        print('Error occurred during sign up: $error');
      }
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = result.user;
    } catch (error) {
      if (kDebugMode) {
        print('Error occurred during sign in: $error');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _user = null;
    } catch (error) {
      if (kDebugMode) {
        print('Error occurred during sign out: $error');
      }
    }
  }
}
