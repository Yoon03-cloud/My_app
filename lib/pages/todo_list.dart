import 'package:flutter/material.dart';
import 'package:my_app/components/my_drawer.dart';  // Import the custom drawer

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<Map<String, dynamic>> tasks = [];
  final TextEditingController taskController = TextEditingController();

  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add({
          'title': taskController.text,
          'isCompleted': false,
        });
        taskController.clear();
      });
    }
  }

  void toggleCompletion(int index) {
    setState(() {
      tasks[index]['isCompleted'] = !tasks[index]['isCompleted'];
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A1E3C),
      ),
      drawer: const MyDrawer(displayName: '',), // Include the updated drawer
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.yellow.shade700, Colors.yellow.shade500],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter your task...',
                      hintStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white, // Set text box background to white
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow.shade200), // Pale yellow border color
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.black),  // Changed plus icon color to black
                  onPressed: addTask,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                      color: Colors.white, // Make task background white
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tasks[index]['title'],
                        style: TextStyle(
                          decoration: tasks[index]['isCompleted']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    leading: Checkbox(
                      value: tasks[index]['isCompleted'],
                      onChanged: (_) => toggleCompletion(index),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
