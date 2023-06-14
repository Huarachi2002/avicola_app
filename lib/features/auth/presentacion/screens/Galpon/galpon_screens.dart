import 'package:flutter/material.dart';

class GalponScreen extends StatelessWidget {
  static const name = 'galpon_screen';
  const GalponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galpones'),
      ),
      body: _GalponView(),
    );
  }
}

class _GalponView extends StatelessWidget {
  _GalponView({super.key});
  final iconGalpon = Icon(
    Icons.home_filled,
    size: 50,
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
        ElevatedButton(
          onPressed: () {},
          // style: ButtonStyle(),
          child: Container(
            child: Column(children: [
              iconGalpon,
            ]),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colores[0],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colores[1],
          ),
          child: Column(
            children: [iconGalpon],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colores[2],
          ),
          child: Column(children: [iconGalpon]),
        ),
      ],
    );
  }
}
