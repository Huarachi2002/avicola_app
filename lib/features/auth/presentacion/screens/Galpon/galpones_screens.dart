import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GalponesScreen extends StatelessWidget {
  static const name = 'galpon_screen';
  const GalponesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galpones'),
      ),
      body: _GalponesView(),
    );
  }
}

class _GalponesView extends StatelessWidget {
  _GalponesView({super.key});
  final iconGalpon = Icon(
    Icons.home_filled,
    size: 60,
  );
  final colores = <Color>[
    Colors.blue.shade100,
    Colors.amber.shade100,
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.purple.shade100,
    Colors.pink.shade100
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colores[0],
          ),
          child: InkWell(
            onTap: () {
              String num = '1';
              context.push('/galpon/$num');
            },
            child: Column(children: [
              iconGalpon,
              Text(
                'Galpon 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Capacidad max.: 2000',
              ),
              Text('Capacidad libre: 0'),
              Text('N° de Lotes: 4'),
              Text('Cuarentena: No')
            ]),
            radius: 20,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colores[1],
          ),
          child: InkWell(
            onTap: () {
              String num = '2';
              context.push('/galpon/$num');
            },
            child: Column(children: [
              iconGalpon,
              Text(
                'Galpon 2',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Capacidad max.: 2000',
              ),
              Text('Capacidad libre: 500'),
              Text('N° de Lotes: 2'),
              Text('Cuarentena: No')
            ]),
            radius: 20,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colores[2],
          ),
          child: InkWell(
            onTap: () {
              String num = '3';
              context.push('/galpon/$num');
            },
            child: Column(children: [
              iconGalpon,
              Text(
                'Galpon 3',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Capacidad max.: 2000',
              ),
              Text('Capacidad libre: 700'),
              Text('N° de Lotes: 1'),
              Text('Cuarentena: No')
            ]),
            radius: 20,
          ),
        ),
      ],
    );
  }
}
