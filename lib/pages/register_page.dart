import 'package:flutter/material.dart';
import 'package:registration_login/components/my_buttonsignup.dart';
import 'package:registration_login/components/my_text_field.dart';
import 'package:registration_login/pages/NextPage.dart';
import 'package:registration_login/pages/login_page.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.grey[800],
                  ),
                  const Text(
                    "Welcome, Great to see you",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  //const SizedBox(height: 10),
                  MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscuretext: false),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'password',
                    obscuretext: true,
                  ),
                  MyTextField(
                    controller: confirmpasswordController,
                    hintText: 'Confirm password',
                    obscuretext: true,
                  ),
                  const Spacer(),
                  MyButtonsignup(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => NextPage()),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already a member? "),
                      const SizedBox(height: 4),
                      ElevatedButton(
                        child: const Text('Login Now'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
