import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Roommates")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("User $index"),
            subtitle: const Text("Budget: 20,000"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(user: {
                    "name": "User $index",
                    "gender": "Male",
                    "country": "Pakistan",
                    "budget": "20,000",
                  }), // ✅ Map pass kiya
                ),
              );
            },
          );
        },
      ),
    );
  }
}