import 'package:flutter/material.dart';

class LoteScreen extends StatefulWidget {
  final String id;
  const LoteScreen({super.key, required this.id});
  static final name = 'Lote - screen';

  @override
  State<LoteScreen> createState() => _LoteScreenState();
}

class _LoteScreenState extends State<LoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lote'),
      ),
      body: _LoteView(),
    );
  }
}

class _LoteView extends StatelessWidget {
  const _LoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
