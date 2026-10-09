import 'package:app_auth/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //supabase setup
  await Supabase.initialize(
    url: 'https://sheweomvitegaeszvyks.supabase.co',
    // ignore: deprecated_member_use
    anonKey: 'sb_publishable_VW9ZAFs7RMgf0eIz3Pdbiw_sg1WdQO3',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AuthGate());
  }
}
