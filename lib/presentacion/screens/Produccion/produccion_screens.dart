import 'package:flutter/material.dart';

class ProduccionScreen extends StatelessWidget {
  static const name = 'producción_screen';
  const ProduccionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Producción'),
      ),
      body: _ProduccionView(),
    );
  }
}

class _ProduccionView extends StatelessWidget {
  const _ProduccionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
