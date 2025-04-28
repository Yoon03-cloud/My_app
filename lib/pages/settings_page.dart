import 'package:flutter/material.dart';
import 'todo_list.dart'; // Ensure ToDoListPage is imported

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("S E T T I N G S",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A1E3C),  // Dark Blue (Header Background)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ToDoListPage()), // Navigate to ToDoListPage
            );
          },
        ),
      ),
      body: Column(
        children: [
          // Notifications Section
          ListTile(
            title: const Text("Notifications"),
            subtitle: const Text("You won't get any push notifications when disabled."),
            trailing: Switch(
              value: false, // Change based on your app's state
              onChanged: (value) {
                // Handle notification toggle
              },
            ),
          ),
          const Divider(),
          // Language Section
          ListTile(
            title: const Text("Language"),
            subtitle: const Text("English"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle language selection
            },
          ),
          const Divider(),
          // Change Password Section
          ListTile(
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle change password
            },
          ),
        ],
      ),
    );
  }
}
