//https://github.com/mitchkoko/EmailLoginLogout/blob/main/lib/main.dart
import 'package:flutter/material.dart';
import 'package:registration_login/pages/auth_page.dart';
//import 'package:registration_login/pages/register_page.dart';
//import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}