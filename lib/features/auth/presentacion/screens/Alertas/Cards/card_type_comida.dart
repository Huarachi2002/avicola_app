import 'package:flutter/material.dart';

class CardTypeComida extends StatefulWidget {
  final String label;
  final double elevation;

  const CardTypeComida({super.key, required this.label, required this.elevation});

  @override
  State<CardTypeComida> createState() => CardTypeComidaState();
}

class CardTypeComidaState extends State<CardTypeComida> {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Row(children: [
                          const Icon(Icons.food_bank),
                          const SizedBox(width: 10),
                          Text(widget.label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ]),
                      ),

                      if(icon == Icons.expand_less)
                      ...[
                        const SizedBox(height: 20),
                        const Text('Cantidad de comida estimada: 500gr\nEstado: Poca comida\nGalpón: 3'),
                      ],
                      
                    ]),
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}