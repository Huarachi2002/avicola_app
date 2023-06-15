import 'package:flutter/material.dart';

class GalponScreen extends StatelessWidget {
  final String num;
  const GalponScreen({super.key, required this.num});
  static final name = 'galpon $Widget.num - screen ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galpon $num'),
      ),
      body: _GalponView(),
    );
  }
}

class _GalponView extends StatelessWidget {
  const _GalponView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
