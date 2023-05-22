import 'package:flutter/material.dart';

class AlertasScreen extends StatelessWidget {
  static const name = 'alertas_screen';
  const AlertasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alertas'),
      ),
      body: const _AlertasView(),
    );
  }
}

class _AlertasView extends StatelessWidget {
  const _AlertasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
