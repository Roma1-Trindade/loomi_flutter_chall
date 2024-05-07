import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loomi_flutter_chall/loomi.dart';
import 'package:loomi_flutter_chall/src/auth/auth_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencyInjection();
  runApp(const Loomi());
}
