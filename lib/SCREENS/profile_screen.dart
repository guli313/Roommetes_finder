import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final Map<String, String> user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool requestSent = false;

  void sendRequest() {
    setState(() {
      requestSent = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Request Sent Successfully")),
    );

    // TODO: yahan Supabase / Firebase API call add karni hai
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user["name"] ?? "Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 10),

            Text(
              "Name: ${widget.user["name"] ?? "N/A"}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            Text(
              "Gender: ${widget.user["gender"] ?? "N/A"}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            Text(
              "Country: ${widget.user["country"] ?? "Pakistan"}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            Text(
              "Budget: ${widget.user["budget"] ?? "N/A"}",
              style: const TextStyle(fontSize: 18),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: requestSent ? null : sendRequest,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  requestSent ? "Request Sent" : "Send Request",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}