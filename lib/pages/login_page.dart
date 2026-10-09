import 'package:app_auth/auth/auth_service.dart';
import 'package:app_auth/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //get auth service
  final authService = AuthService();

  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //login button pressed
  void login() async {
    //prepare data
    final email = emailController.text;
    final password = passwordController.text;

    //attempt login..
    try {
      await authService.signInWithEmail(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  //Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("logIn")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          //email
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          //password
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: "Password"),
          ),

          const SizedBox(height: 12),
          //button
          ElevatedButton(onPressed: login, child: const Text("Login")),

          const SizedBox(height: 12),

          //go to register page
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            ),
            child: Center(child: Text("Don't have an account? Sign Up")),
          ),
        ],
      ),
    );
  }
}
