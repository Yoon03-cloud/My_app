import 'package:flutter/material.dart';
import 'package:my_app/pages/ContactUsPage.dart';
import 'package:my_app/pages/QandAPage.dart';
import 'package:my_app/pages/profile.dart';
import 'package:my_app/pages/settings_page.dart';
import 'package:my_app/pages/todo_list.dart';
import 'package:provider/provider.dart';
import 'package:my_app/pages/home_page.dart';  // Import your pages
import 'package:my_app/themes/theme_provider.dart';  // Import ThemeProvider
import 'package:my_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Error initializing Firebase: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/home', // Set the default route here
      routes: {
        '/home': (context) => const HomePage(),
        '/settings': (context) => const SettingsPage(),
        '/profile': (context) => const ProfilePage(),
        '/to_do_list': (context) => const ToDoListPage(),
        '/q_and_a': (context) => const QandAPage(), // Add Q&A route
        '/contact_us': (context) => const ContactUsPage(), // Add Contact Us route
      },
    );
  }
}
