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
      child: Image(
          image: NetworkImage(
              'https://avinews.com/wp-content/uploads/2016/09/plan_de_vacunacion_reproductoras.jpg')),
    );
  }
}
