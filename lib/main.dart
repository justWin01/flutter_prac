import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Practice'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===== SCAFFOLD =====
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
                    builder: (context) => const About(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // ===== APPBAR =====
      appBar: AppBar(
        title: Text(title),
        actions: [
          // ===== ICONBUTTON =====
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

      // ===== BODY =====
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // ===== LISTVIEW =====
        child: ListView(
          children: [
            // ===== CENTER =====
            const Center(
              child: Text(
                'First Flutter Prac1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ===== SIZEDBOX =====
            const SizedBox(height: 20),

            // ===== IMAGE =====
            Center(
              child: Image.network(
                'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
                height: 80,
              ),
            ),

            const SizedBox(height: 20),

            // ===== CONTAINER =====
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(15),
              ),

              // ===== COLUMN =====
              child: const Column(
                children: [
                  // ===== ICON =====
                  Icon(
                    Icons.flutter_dash,
                    size: 60,
                    color: Colors.blue,
                  ),

                  SizedBox(height: 10),

                  // ===== TEXT =====
                  Text(
                    'Welcome to Flutter!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'This is my Flutter Practice 1.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== ROW =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.blue,
                ),
                const Icon(
                  Icons.favorite,
                  size: 35,
                  color: Colors.red,
                ),
                const Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.green,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== STACK =====
            SizedBox(
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.blue.shade200,
                  ),
                  const Icon(
                    Icons.flutter_dash,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const Positioned(
                    bottom: 10,
                    child: Text(
                      'Stack',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== EXPANDED =====
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Expanded 1',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Expanded 2',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== ELEVATEDBUTTON =====
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Elevated Button clicked!'),
                  ),
                );
              },
              child: const Text('Elevated Button'),
            ),

            // ===== TEXTBUTTON =====
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

            // ===== ICONBUTTON =====
            Center(
              child: IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 40,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Favorite clicked!'),
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

// ===== ABOUT PAGE =====

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Center(
        child: Text(
          'This is the About Page',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
