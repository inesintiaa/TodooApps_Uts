import 'package:flutter/material.dart';
import 'package:utsine/main.dart';


class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  void saveTask() {
    // Menyimpan data ke task baru
    final newTask = {
      "title": titleController.text,
      "description": descriptionController.text,
      "date": dateController.text,
      "time": timeController.text,
    };

    // Kembali ke halaman sebelumnya dengan data baru
    Navigator.pop(context, newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create To-Do"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding(context),
            vertical: verticalPadding(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: "Date"),
              ),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(labelText: "Time"),
              ),
              const SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: saveTask,
                child: const Text("Save Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

