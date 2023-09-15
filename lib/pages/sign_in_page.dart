import 'package:bloc_todo/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/firebase_ser.dart';
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    final user = await AuthService.signIn(email, password);
    debugPrint("USER: $user");
    if (user != null && context.mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sign In",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.cyan),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Email", border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: "Password", border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  onPressed: signIn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: const Text("Sign In",style: TextStyle(color: Colors.white),))),
              const SizedBox(
                height: 20,
              ),
               Row(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Don't have an account?",style: TextStyle(color: Colors.white),),
                  const SizedBox(width: 2,),
                  TextButton( onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
                  },child: const Text("Sign Up")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
