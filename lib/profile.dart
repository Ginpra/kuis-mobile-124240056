import 'package:flutter/material.dart';
import 'colors.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: const NetworkImage('data:image/jpeg;base64,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'),
              ),
              const SizedBox(height: 16),
              const Text('Username', style: TextStyle(color: Colors.grey)),
              Text(
                username,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, size: 18),
                label: const Text('Logout'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: kNavy,
                  side: const BorderSide(color: kNavy),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
