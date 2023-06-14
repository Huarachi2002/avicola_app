import 'package:flutter/material.dart';

class GalponScreen extends StatelessWidget {
  static const name = 'galpon_screen';
  const GalponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galpones'),
      ),
      body: const _GalponView(),
    );
  }
}

class _GalponView extends StatelessWidget {
  const _GalponView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: [],
    );
  }
}
