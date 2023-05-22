import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screem';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Usuario'),
      ),
    );
  }
}

class _LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
