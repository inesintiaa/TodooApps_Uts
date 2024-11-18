import 'package:flutter/material.dart';

class EditTaskPage extends StatefulWidget {
  final Map<String, String> task; // Data tugas yang akan diedit

  const EditTaskPage({super.key, required this.task});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data yang diterima
    titleController = TextEditingController(text: widget.task['title']);
    descriptionController = TextEditingController(text: widget.task['description']);
    dateController = TextEditingController(text: widget.task['date']);
    timeController = TextEditingController(text: widget.task['time']);
  }

  void saveEditedTask() {
    // Data tugas yang telah diperbarui
    final editedTask = {
      "title": titleController.text,
      "description": descriptionController.text,
      "date": dateController.text,
      "time": timeController.text,
    };

    // Kembali ke halaman sebelumnya dengan data yang diperbarui
    Navigator.pop(context, editedTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              onPressed: saveEditedTask,
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
