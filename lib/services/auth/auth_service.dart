import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Firebase Auth Error Handling (mobile and web)
      debugPrint('Firebase Auth Error: ${e.message}');
      throw Exception('Failed to sign in: ${e.message}');
    } catch (e) {
      // General error handling for Web Firebase Exceptions
      debugPrint('General error: $e');
      throw Exception('Failed to sign in: $e');
    }
  }

  // Register a new user with email and password
  Future<User?> signUp(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Auth Error: ${e.message}');
      throw Exception('Failed to sign up: ${e.message}');
    } catch (e) {
      debugPrint('General error: $e');
      throw Exception('Failed to sign up: $e');
    }
  }

  // Get the current user
  User? get currentUser => _auth.currentUser;

  // Sign out the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
