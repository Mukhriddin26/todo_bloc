
import 'package:bloc_todo/pages/sign_in_page.dart';
import 'package:bloc_todo/service/firebase_ser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    if(email.isEmpty || password.isEmpty) {
      return;
    }

    final success = await AuthService.signUp(email, password);
    if(success && context.mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sign Up",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
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
                  onPressed: signUp,
                  child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: const Text("Sign Up",style: TextStyle(color: Colors.white),))),
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
                        builder: (context) => const SignInPage()));
                  },child: const Text("Sign In")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}