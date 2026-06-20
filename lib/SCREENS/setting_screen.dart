import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final nameController = TextEditingController();

  File? imageFile;

  final user = Supabase.instance.client.auth.currentUser;

  @override
  void initState() {
    super.initState();
    nameController.text = user?.userMetadata?['name'] ?? "";
  }

  // 📸 PICK IMAGE
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  // ☁ UPLOAD IMAGE
  Future<String?> uploadImage(File file) async {
    final fileName = "${user!.id}.jpg";

    await Supabase.instance.client.storage
        .from('profile_images')
        .upload(fileName, file, fileOptions: const FileOptions(upsert: true));

    return Supabase.instance.client.storage
        .from('profile_images')
        .getPublicUrl(fileName);
  }

  // 💾 SAVE PROFILE
  Future<void> saveProfile() async {
    String? imageUrl;

    if (imageFile != null) {
      imageUrl = await uploadImage(imageFile!);
    }

    await Supabase.instance.client.auth.updateUser(
      UserAttributes(
        data: {
          'name': nameController.text,
          'avatar': imageUrl,
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Updated")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 👤 PROFILE IMAGE
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                imageFile != null ? FileImage(imageFile!) : null,
                child: imageFile == null
                    ? const Icon(Icons.camera_alt)
                    : null,
              ),
            ),

            const SizedBox(height: 20),

            // ✏ NAME EDIT
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Change Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // 💾 SAVE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveProfile,
                child: const Text("Save Changes"),
              ),
            ),

            const SizedBox(height: 20),

            // 🔐 CHANGE PASSWORD OPTION
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Change Password"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Use email reset from Supabase")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}