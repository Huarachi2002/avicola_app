import 'package:flutter/material.dart';

final cards = <Map<String, dynamic>>[];

// const cards = <Map<String, dynamic>>[
//   {'elevation': 0.0, 'label': 'Elevation 0'},
//   {'elevation': 1.0, 'label': 'Elevation 1'},
//   {'elevation': 2.0, 'label': 'Elevation 2'},
//   {'elevation': 3.0, 'label': 'Elevation 3'},
//   {'elevation': 4.0, 'label': 'Elevation 4'},
//   {'elevation': 5.0, 'label': 'Elevation 5'},
// ];

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final i = cards.length + 1;
          cards.add({'elevattion': i, 'label': 'Elevation $i'});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AlertasView extends StatelessWidget {
  const _AlertasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ...cards.map(
          //   (card) => _CardType1( elevation: card['elevation'], label: card['label'] ),
          // ),

          // ...cards.map(
          //   (card) => _CardType2( elevation: card['elevation'], label: card['label'] ),
          // ),

          ...cards.map(
            (card) =>
                _CardType(elevation: card['elevation'], label: card['label']),
          ),

          // ...cards.map(
          //   (card) => _CardType4( elevation: card['elevation'], label: card['label'] ),
          // ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _CardType extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )
          ],
        ),
      ),
    );
  }
}
