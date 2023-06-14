import 'package:flutter/material.dart';

class GestionUsuarioScreen extends StatelessWidget {
  const GestionUsuarioScreen({super.key});
  static final name = 'gestion usuario - screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion de Usuario'),
      ),
      body: _GestionUsuarioView(),
    );
  }
}

class _GestionUsuarioView extends StatelessWidget {
  const _GestionUsuarioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
