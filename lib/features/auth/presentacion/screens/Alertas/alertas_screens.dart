import 'package:avicola/features/auth/presentacion/screens/Alertas/Cards/card_type_agua.dart';
import 'package:avicola/features/auth/presentacion/screens/Alertas/Cards/card_type_comida.dart';
import 'package:avicola/features/auth/presentacion/screens/Alertas/Cards/card_type_enfermedad.dart';
import 'package:avicola/features/auth/presentacion/screens/Alertas/Cards/card_type_humedad.dart';
import 'package:avicola/features/auth/presentacion/screens/Alertas/Cards/card_type_termo.dart';
import 'package:avicola/features/auth/presentacion/screens/Alertas/Cards/card_type_vacuna.dart';

import 'package:flutter/material.dart';

// final cards = <Map<String, dynamic>>[];

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
  const _AlertasView();

  @override
  Widget build(BuildContext context) {
    return const _CardsView();
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CardTypeVacuna(label: 'Alerta de vacunación', elevation: 2.0),
          // SizedBox(height: 2),
          CardTypeComida(label: 'Alerta de comida', elevation: 2.0),
          CardTypeTermo(label: 'Alerta de temperatura', elevation: 2.0),
          CardTypeAgua(label: 'Alerta de agua', elevation: 2.0),
          CardTypeEnfermedad(label: 'Alerta de enfermedad', elevation: 2.0),
          CardTypeHumedad(label: 'Alerta de humedad', elevation: 2.0),
        ],
      ),
    );
  }
}