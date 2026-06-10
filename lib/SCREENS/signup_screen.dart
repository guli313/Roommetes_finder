import 'package:flutter/material.dart';
import 'home_screen.dart'; // ✅ import add kiya

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const TextField(
              decoration: InputDecoration(labelText: "Name"),
            ),

            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),

            const SizedBox(height: 10),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),

            const SizedBox(height: 20),

            // ✅ Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                child: const Text("Sign Up"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}