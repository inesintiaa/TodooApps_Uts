import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utsine/main.dart';
import 'package:utsine/screens/edit_task_page.dart';

import 'package:utsine/widgets/spacing.dart';
import 'package:utsine/widgets/today_and_filter_button.dart';
import 'add_task_page.dart'; // Import halaman AddTaskPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List untuk menyimpan semua tugas (dengan tugas anonim sebagai default)
  final List<Map<String, String>> tasks = [
    {
      "title": "Anonymous Task 1",
      "description": "This is a sample task description.",
      "date": "2024-11-17",
      "time": "10:00 AM",
    },
    {
      "title": "Anonymous Task 2",
      "description": "Another task description for testing.",
      "date": "2024-11-18",
      "time": "2:00 PM",
    },
    {
      "title": "Anonymous Task 1",
      "description": "This is a sample task description.",
      "date": "2024-11-17",
      "time": "10:00 AM",
    },
    {
      "title": "Anonymous Task 2",
      "description": "Another task description for testing.",
      "date": "2024-11-18",
      "time": "2:00 PM",
    },
    {
      "title": "Anonymous Task 1",
      "description": "This is a sample task description.",
      "date": "2024-11-17",
      "time": "10:00 AM",
    },
    {
      "title": "Anonymous Task 2",
      "description": "Another task description for testing.",
      "date": "2024-11-18",
      "time": "2:00 PM",
    },
    {
      "title": "Anonymous Task 1",
      "description": "This is a sample task description.",
      "date": "2024-11-17",
      "time": "10:00 AM",
    },
    {
      "title": "Anonymous Task 2",
      "description": "Another task description for testing.",
      "date": "2024-11-18",
      "time": "2:00 PM",
    },
    {
      "title": "Anonymous Task 1",
      "description": "This is a sample task description.",
      "date": "2024-11-17",
      "time": "10:00 AM",
    },
    {
      "title": "Anonymous Task 2",
      "description": "Another task description for testing.",
      "date": "2024-11-18",
      "time": "2:00 PM",
    },
    {
      "title": "Anonymous Task 1",
      "description": "This is a sample task description.",
      "date": "2024-11-17",
      "time": "10:00 AM",
    },
    {
      "title": "Anonymous Task 2",
      "description": "Another task description for testing.",
      "date": "2024-11-18",
      "time": "2:00 PM",
    },
  ];

  void navigateToAddTaskPage() async {
    // Navigasi ke halaman AddTaskPage dan mendapatkan hasil
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskPage()),
    );

    if (newTask != null) {
      // Menambahkan tugas baru ke daftar
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  void navigateToEditTaskPage(int index) async {
    // Navigasi ke halaman EditTaskPage dengan tugas yang dipilih
    final editedTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTaskPage(task: tasks[index]),
      ),
    );

    if (editedTask != null) {
      // Perbarui tugas yang diedit di daftar
      setState(() {
        tasks[index] = editedTask;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddTaskPage,
        backgroundColor: blackColor,
        elevation: 0,
        splashColor: blueColor,
        shape: const CircleBorder(),
        child: SvgPicture.asset(
          "assets/plus.svg",
          height: MediaQuery.of(context).size.height * 0.02,
        ),
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
              const TodayAndFilterButton(),
              const Spacing(),
              // Menampilkan daftar tugas
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tasks[index]['title']!),
                      subtitle: Text(tasks[index]['description']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => navigateToEditTaskPage(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
