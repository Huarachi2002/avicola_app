import 'package:flutter/material.dart';

class VacunasScreen extends StatelessWidget {
  static const name = "vacunas-screen";
  const VacunasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vacunas'),
      ),
      body: _VacunasView(),
    );
  }
}

class _VacunasView extends StatelessWidget {
  const _VacunasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Image(image: AssetImage('assets/images/esqVacuna.jpg')),
    );
  }
}
