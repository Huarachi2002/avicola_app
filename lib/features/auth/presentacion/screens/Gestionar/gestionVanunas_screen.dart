import 'package:flutter/material.dart';

class GestionVacunasScreen extends StatelessWidget {
  const GestionVacunasScreen({super.key});
  static final name = 'gestion vacunas - screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion de Vacunas'),
      ),
      body: _GestionVacunasView(),
    );
  }
}

class _GestionVacunasView extends StatelessWidget {
  const _GestionVacunasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
