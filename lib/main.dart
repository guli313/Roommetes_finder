import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:roommetes_finder/SCREENS/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  debugPrint('🔄 Initializing Supabase...');

  try {
    await Supabase.initialize(
      url: 'https://hrytmyzrzztkikulifuh.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhyeXRteXpyenp0a2lrdWxpZnVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA5ODcyOTcsImV4cCI6MjA5NjU2MzI5N30.eN-8Q0gtiLPxUi--Y4o7zbbnRWU7iKD50ahLqhYGeS0',
    );
    debugPrint('✅ Supabase initialized successfully');
  } catch (e) {
    debugPrint('❌ Supabase initialization failed: $e');
  }

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🚀 MyApp building...');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roommate Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}