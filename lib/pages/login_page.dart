import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_login/components/my_text_field.dart';
import 'package:registration_login/pages/register_page.dart';
import '../components/my_button.dart';
import 'package:registration_login/components/square_tile.dart';

//import 'package:flutter/cupertino.dart';
//import 'package:registration_login/pages/NextPage.dart';
//import 'package:registration_login/pages/register_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'invalid-credential') {
        // show error to user
        wrongCredential();
      }

      // // WRONG PASSWORD
      // else if (e.code == "") {
      //   // show error to user
      //   blankPasswordMessage();
      // } else if (e.code == 'wrong-password') {
      //   // show error to user
      //   wrongPasswordMessage();
      // }
    }
  }

  // wrong email message popup
  void wrongCredential() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Invalid Credentials',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // // wrong password message popup
  // void wrongPasswordMessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title: Center(
  //           child: Text(
  //             'Incorrect Password',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // void blankPasswordMessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title: Center(
  //           child: Text(
  //             'Kindly enter the Password',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.lock,
                color: Color.fromARGB(255, 11, 87, 13),
                size: 100,
              ),
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[1000],
                  fontSize: 16,
                ),
              ),
              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscuretext: false,
              ),
              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscuretext: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[1000]),
                    ),
                  ],
                ),
              ),

              //const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),

              //const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[1000]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              //const SizedBox(height: 50),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'images/google.png'),

                  SizedBox(width: 20),

                  // apple button
                  SquareTile(imagePath: 'images/apple.png')
                ],
              ),

              //const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[1000]),
                  ),
                  ElevatedButton(
                    child: const Text('Register Now'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   void signUserIn() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: emailController.text,
//       password: passwordController.text,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 100),
//               Icon(
//                 Icons.lock,
//                 size: 100,
//                 color: Colors.grey[800],
//               ),
//               const Text(
//                 "Welcome back, you've been missed!",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               MyTextField(
//                   controller: emailController,
//                   hintText: 'Email',
//                   obscuretext: false),
//               const SizedBox(height: 10),
//               MyTextField(
//                 controller: passwordController,
//                 hintText: 'password',
//                 obscuretext: true,
//               ),
//               const Spacer(),
//               TextButton(
//                   onPressed: () => signUserIn(),
//                   child: const Text("Sign In...")),
//               // MyButton(
//               //     onTap: signUserIn,
//               //     //{
//               //     //   Navigator.push(
//               //     //     context,
//               //     //     CupertinoPageRoute(builder: (context) => NextPage()),
//               //     //   );
//               //     //  },
//               //     text: "Sign In"),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Not a member? "),
//                   const SizedBox(height: 4),
//                   ElevatedButton(
//                     child: const Text('Register Now'),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         CupertinoPageRoute(
//                             builder: (context) => RegisterPage()),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
