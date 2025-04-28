import 'package:flutter/material.dart';
import 'package:my_app/pages/todo_list.dart';  // Import ToDoListPage to navigate to it when back is pressed

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connect to Us", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A1E3C), // Header color for contact page
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate back to ToDoListPage instead of login page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ToDoListPage()), // Replace with ToDoListPage
            );
          },
        ),
      ),
      body: ListView(
        children: [
          // Instagram Row
          _buildSocialMediaRow(
            icon: Icons.camera_alt, 
            platform: 'Instagram', 
            username: 'sheinofficial'
          ),
          const Divider(),
          // Facebook Row
          _buildSocialMediaRow(
            icon: Icons.facebook, 
            platform: 'Facebook', 
            username: 'SHEIN'
          ),
          const Divider(),
          // Snapchat Row
          _buildSocialMediaRow(
            icon: Icons.snapchat, 
            platform: 'Snapchat', 
            username: 'sheinofficial'
          ),
          const Divider(),
          // Twitter Row
          _buildSocialMediaRow(
            icon: Icons.chat_bubble, 
            platform: 'Twitter', 
            username: 'Shelin_official'
          ),
          const Divider(),
          // YouTube Row
          _buildSocialMediaRow(
            icon: Icons.video_library, 
            platform: 'YouTube', 
            username: 'sheinofficial'
          ),
          const Divider(),
        ],
      ),
    );
  }

  // Helper function to build each social media row
  Widget _buildSocialMediaRow({required IconData icon, required String platform, required String username}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(platform),
      subtitle: Text(username),
      trailing: ElevatedButton(
        onPressed: () {
          // Logic for "Follow" button (you can add actions here, like linking to the social media page)
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, // Button color
        ),
        child: const Text('Follow'),
      ),
    );
  }
}
