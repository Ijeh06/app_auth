/*

Auth Gate is a widget that checks if the user is authenticated and redirects to the login page if not.


-----------------------------------

unauthenticated => Login Page
authenticated => Profile Page


 */

import 'package:app_auth/pages/login_page.dart';
import 'package:app_auth/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //listen to auth state changes

      stream: Supabase.instance.client.auth.onAuthStateChange,
      //build state
      builder: (context, snapshot) {
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        /// check if there is a valid session currently
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          return ProfilePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
