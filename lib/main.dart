import 'package:flutter/material.dart';
import 'package:roommetes_finder/SCREENS/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'SCREENS/Splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ zaroor hona chahiye

  await Supabase.initialize(
    url: 'https://hrytmyzrzztkikulifuh.supabase.co',       // ✅ apna URL dalein
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhyeXRteXpyenp0a2lrdWxpZnVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA5ODcyOTcsImV4cCI6MjA5NjU2MzI5N30.eN-8Q0gtiLPxUi--Y4o7zbbnRWU7iKD50ahLqhYGeS0', // ✅ apni key dalein
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}