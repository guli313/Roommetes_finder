import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> users = [
    {"name": "Ali", "city": "Skardu"},
    {"name": "Ahmed", "city": "Gilgit"},
    {"name": "Usman", "city": "Hunza"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Find Roommates")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(users[index]["name"]!),
            subtitle: Text(users[index]["city"]!),
            trailing: ElevatedButton(
              child: const Text("View"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(user: users[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}