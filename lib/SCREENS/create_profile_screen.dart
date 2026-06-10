import 'package:flutter/material.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Profile")),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(decoration: InputDecoration(labelText: "Name")),
            TextField(decoration: InputDecoration(labelText: "Age")),
            TextField(decoration: InputDecoration(labelText: "Budget")),

          ],
        ),
      ),
    );
  }
}