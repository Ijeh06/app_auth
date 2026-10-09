import 'package:app_auth/auth/auth_service.dart';
import 'package:app_auth/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const new({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //get auth service
  final authService = AuthService();

  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPaswordController = TextEditingController();

  void signUp() async {
    //prepare data
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPaswordController.text;

    //check password match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Password did not match")));
      return;
    }

    //attempt signup
    try {
      await authService.signUpWithEmail(email, password);

      //popup the register page
      Navigator.pop(context);
    }
    //catch error
    catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Password did not match")));
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
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
          TextField(
            controller: confirmPaswordController,
            decoration: const InputDecoration(labelText: "Confirm Password"),
          ),

          const SizedBox(height: 12),
          //button
          ElevatedButton(onPressed: signUp, child: const Text("SignUp")),

          const SizedBox(height: 12),

          //go to register page
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ),
            child: Center(child: Text("Already have an account login")),
          ),
        ],
      ),
    );
  }
}
