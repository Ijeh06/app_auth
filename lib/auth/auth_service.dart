import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in a user with email and password
  Future<AuthResponse> signInWithEmail(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  // Sign up a new user with email and password
  Future<AuthResponse> signUpWithEmail(String email, String password) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
    );
    return response;
  }

  // Sign out the current user
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Get the current user
  String? getCurrentUser() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
