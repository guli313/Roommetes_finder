import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Column(
        children: [

          const Expanded(
            child: Center(child: Text("Messages here")),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [

                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type message...",
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}