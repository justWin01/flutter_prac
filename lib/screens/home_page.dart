import 'package:flutter/material.dart';

import '../models/student.dart';
import '../widgets/student_card.dart';
import 'about_page.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Creating Student objects
    Student student1 = Student(
      name: 'Sherwin',
      age: 20,
      course: 'IT',
    );

    Student student2 = Student(
      name: 'John',
      age: 21,
      course: 'Criminology',
    );

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'My Flutter App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notification clicked!'),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Text(
              'First Flutter Prac1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Student object 1
          StudentCard(student: student1),

          // Student object 2
          StudentCard(student: student2),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.home),
              const Icon(Icons.favorite),
              const Icon(Icons.person),
            ],
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              student1.introduce();
            },
            child: const Text('Introduce Student'),
          ),

          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Text Button clicked!'),
                ),
              );
            },
            child: const Text('Text Button'),
          ),
        ],
      ),
    );
  }
}
