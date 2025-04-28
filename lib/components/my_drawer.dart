import 'package:flutter/material.dart';
import 'package:my_app/pages/ContactUsPage.dart';
import 'package:my_app/pages/QandAPage.dart';
import 'package:my_app/pages/settings_page.dart'; // Import SettingsPage
import 'package:my_app/pages/profile.dart'; // Import ProfilePage

class MyDrawer extends StatelessWidget {
  final String displayName; // Pass the updated display name from ProfilePage

  const MyDrawer({super.key, required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black, // Dark background color for the drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with Profile
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow.shade700, // Header background color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person, 
                      size: 40, 
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    displayName, // Display updated name from ProfilePage
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            // Drawer items
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.white),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.white),
              title: Text('Q & A', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const QandAPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, color: Colors.white),
              title: Text('Contact Us', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
