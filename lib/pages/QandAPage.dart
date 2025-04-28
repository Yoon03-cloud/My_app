import 'package:flutter/material.dart';
import 'package:my_app/pages/todo_list.dart'; // Import ToDoListPage to navigate to it when back is pressed

class QandAPage extends StatelessWidget {
  const QandAPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A1E3C), // App bar color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate to ToDoListPage when back icon is pressed
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ToDoListPage()), // Replace with ToDoListPage
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildQuestionAnswer(
            question: "Why can't I see my tasks after adding them?",
            answer:
                "If you have added tasks but they are not showing up, make sure that you have pressed the 'Save' or 'Add' button properly. Also, check if your device's network connection is stable, as data might not sync properly without an active internet connection. If the issue persists, try restarting the app.",
          ),
          const Divider(),
          _buildQuestionAnswer(
            question: "How do I mark a task as completed?",
            answer:
                "To mark a task as completed, simply click the checkbox next to the task. When checked, the task will be crossed out to indicate that it has been completed. You can also uncheck the box to mark the task as pending again.",
          ),
          const Divider(),
          _buildQuestionAnswer(
            question: "Why does the app not sync my tasks across devices?",
            answer:
                "To sync tasks between multiple devices, ensure that you are signed in with the same account on all devices. Additionally, check if your device's internet connection is active and stable. If the issue persists, try restarting the app or re-logging into your account.",
          ),
          const Divider(),
        ],
      ),
    );
  }

  // Helper function to build each question and answer section
  Widget _buildQuestionAnswer({required String question, required String answer}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Question text color
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(
              Icons.fiber_manual_record,
              size: 10,
              color: Colors.red, // Dot color
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
