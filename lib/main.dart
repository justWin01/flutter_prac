import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration',
      theme: ThemeData(
        primaryColor: const Color(0xff22e171),
      ),
      home: const MyHomePage(title: 'Hadukin'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const UserForm(),
    );
  }
}

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _FormState();
}

class _FormState extends State<UserForm> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  String info = "";

  void submitForm() {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        !emailController.text.contains("@") ||
        passwordController.text.isEmpty ||
        passwordController.text != confirmpasswordController.text) {
      setState(() {
        info = "Invalid input\nPlease check your details.";
      });
    } else {
      setState(() {
        info = "Registration Successful\n\n"
            "Name: ${firstnameController.text} ${lastnameController.text}\n"
            "Email: ${emailController.text}";
      });

      firstnameController.clear();
      lastnameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmpasswordController.clear();
    }
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Registration Form",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: firstnameController,
              decoration: const InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: lastnameController,
              decoration: const InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: confirmpasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitForm,
                child: const Text("REGISTER"),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              info,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
