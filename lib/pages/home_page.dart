import 'package:flutter/material.dart';
import 'package:my_app/pages/login_page.dart';  // Import LoginPage
import 'package:my_app/pages/register_page.dart';  // Import RegisterPage
import 'package:my_app/components/my_drawer.dart';  // Import MyDrawer widget

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,  // Transparent to show gradient
      drawer: const MyDrawer(displayName: '',),  // Include the drawer for menu icon
      appBar: AppBar(
        title: const Text("HOME", style: TextStyle(color: Colors.white)),  // White title text
        centerTitle: true,
        backgroundColor: const Color(0xFF1A1E3C),  // Dark Blue (Header Background)
        elevation: 0,  // Remove elevation to keep it flat
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),  // White menu icon
          onPressed: () {
            Scaffold.of(context).openDrawer();  // Open the drawer when the menu icon is pressed
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFBB13C),  // Darker Yellow
              const Color(0xFFF8E72F),  // Lighter Yellow
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.checklist_rounded,  // Task list icon (checklist)
                size: 80,
                color: Colors.white,  // White icon to stand out on the gradient
              ),
              const SizedBox(height: 20), // Add space between icon and text
              Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,  // White text to stand out on the gradient
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "This is your personal to-do list app. Create, track, and manage tasks easily.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.8),  // Slightly transparent text for intro
                ),
              ),
              const SizedBox(height: 50),

              // Register Button (Bigger size)
              SizedBox(
                width: double.infinity,  // Make the button width stretch to fill the space
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage(onTap: null)),  // Navigate to RegisterPage
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.white, 
                    padding: const EdgeInsets.symmetric(vertical: 20), 
                    textStyle: const TextStyle(fontSize: 18), 
                  ),
                  child: const Text('Register'),
                ),
              ),
              const SizedBox(height: 20),

              // Login Button (Bigger size)
              SizedBox(
                width: double.infinity,  // Make the button width stretch to fill the space
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage(onTap: null)),  // Navigate to LoginPage
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.white, 
                    padding: const EdgeInsets.symmetric(vertical: 20), 
                    textStyle: const TextStyle(fontSize: 18), 
                  ),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
