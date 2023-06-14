import 'package:flutter/material.dart';

// final cards = <Map<String, dynamic>>[];

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

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
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (card) =>_CardType(elevation: card['elevation'], label: card['label']),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _CardType extends StatefulWidget {
  final String label;
  final double elevation;

  const _CardType({required this.label, required this.elevation});

  @override
  State<_CardType> createState() => _CardTypeState();
}

class _CardTypeState extends State<_CardType> {
  IconData icon = Icons.expand_more;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
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
                    } else {
                      icon = Icons.expand_more;
                    }
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('${widget.label} - Filled'),
            )
          ],
        ),
      ),
    );
  }
}
