import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<User?> signInWithGoogle();
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> resetPassword({
    required String email,
  });
  Future<void> deleteAccount();
  Future<void> signOut();
  User? getCurrentUser();
  Stream<User?> authStateChanges();
}
