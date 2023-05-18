import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:your_app/auth.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  void _signIn(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    await authProvider.signIn(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _signIn(context),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
