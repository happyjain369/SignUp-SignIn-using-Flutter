import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_login/pages/login_page.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "You are in...!!!",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              TextButton(
                child: const Text(
                  'Click here to log out',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
