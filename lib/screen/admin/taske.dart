import 'package:flutter/material.dart';
import 'package:peport_app/screen/user/drawer.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      drawer: const DrawerScreen(),
    );
  }
}
