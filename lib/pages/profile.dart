import 'package:flutter/material.dart';
import 'package:my_app/services/auth/auth_service.dart';
import 'todo_list.dart';  // Import ToDoListPage
import 'edit_profile_page.dart';  // Import EditProfilePage
import 'login_page.dart';  // Import LoginPage

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? displayName = "No Name Set";  // Default name
  String? email = "example@mfu.ac.th"; // Default email

  // Method for logging out
  Future<void> logOut() async {
    await AuthService().signOut(); // Log out using AuthService
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage(onTap: null)),
    );  // Navigate to login page
  }

  // Method for editing nickname
  void editNickname() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nicknameController = TextEditingController();
        nicknameController.text = displayName ?? ''; // Set current nickname

        return AlertDialog(
          title: const Text('Edit Nickname'),
          content: TextField(
            controller: nicknameController,
            decoration: const InputDecoration(hintText: "Enter new nickname"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  displayName = nicknameController.text; // Update nickname
                });
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog without saving
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: const Color(0xFF1A1E3C), // Background color of app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ToDoListPage()), // Navigate to ToDoListPage
            );
          },
        ),
      ),
      backgroundColor: Colors.yellow.shade700, // Background color for the profile page
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.yellow.shade700, Colors.yellow.shade500],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture (Circular avatar)
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white, // Profile image background
                child: const Icon(
                  Icons.person, 
                  size: 60, 
                  color: Colors.white,  // Profile icon color
                ),
              ),
              const SizedBox(height: 20),
              // Display name
              Text(
                displayName ?? "No Name Set",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Email display
              Text(
                email ?? "No Email Set",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              // Edit Nickname Button
              SizedBox(
                width: double.infinity,  // Make the button width stretch to fill the space
                child: ElevatedButton(
                  onPressed: editNickname,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.shade400, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text("Edit Nickname", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
              // Log Out Button
              SizedBox(
                width: double.infinity,  // Make the button width stretch to fill the space
                child: ElevatedButton(
                  onPressed: logOut,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text("Log Out", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
