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
          _CardTypeVacuna(label: 'Alerta de vacunación', elevation: 2.0),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _CardTypeVacuna extends StatefulWidget {
  final String label;
  final double elevation;

  const _CardTypeVacuna({required this.label, required this.elevation});

  @override
  State<_CardTypeVacuna> createState() => _CardTypeVacunaState();
}

class _CardTypeVacunaState extends State<_CardTypeVacuna> {
  IconData icon = Icons.expand_more;
  double h = 100.0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: h,
        child: Card(
          color: colors.surfaceVariant,
          elevation: widget.elevation,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(icon),
                    onPressed: () {
                      setState(() {
                        if (icon == Icons.expand_more) {
                          icon = Icons.expand_less;
                          h = h + 100.0;
                        } else {
                          icon = Icons.expand_more;
                          h = h - 100.0;
                        }
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children:[
                      Text(widget.label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      if(icon == Icons.expand_less)
                      ...[
                        const SizedBox(height: 20),
                        const Text('Fecha de vacunación: 30/06/2023\nVacuna: AntiMoquillo\nGalpón: 2'),
                      ],
                      
                    ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardTypeComida extends StatefulWidget {
  const _CardTypeComida();

  @override
  State<_CardTypeComida> createState() => __CardTypeComidaState();
}

class __CardTypeComidaState extends State<_CardTypeComida> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}