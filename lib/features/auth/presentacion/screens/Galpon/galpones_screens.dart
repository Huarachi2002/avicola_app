import 'package:avicola/objectbox.g.dart';
import 'package:flutter/material.dart';
import 'package:avicola/features/models/models.dart';
import 'package:go_router/go_router.dart';
// import 'package:objectbox/objectbox.dart';
import 'package:avicola/features/auth/presentacion/screens/Galpon/addGalpon_screen.dart';
// import 'package:go_router/go_router.dart';

class GalponesScreen extends StatefulWidget {
  static const name = 'galpones_screen';
  const GalponesScreen({super.key});

  @override
  State<GalponesScreen> createState() => _GalponesScreenState();
}

class _GalponesScreenState extends State<GalponesScreen> {
  final _galpones = <Galpon>[];
  late final Store _store;
  late final Box<Galpon> _galponesBox;

  Future<void> _addGalpon() async {
    final result = await showDialog(
        context: context, builder: (_) => const AddGalponScreen());
    if (result != null && result is Galpon) {
      // insert into the database
      _galponesBox.put(result);
      _loadGalpones();
    }
  }

  void _loadGalpones() {
    _galpones.clear();
    setState(() {
      _galpones.addAll(_galponesBox.getAll());
    });
  }

  Future<void> _loadStore() async {
    _store = await openStore();
    _galponesBox = _store.box<Galpon>();
    _loadGalpones();
  }

  @override
  void initState() {
    _loadStore();
    super.initState();
  }

  @override
  void dispose() {
    _store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galpones'),
      ),
      body: _galpones.isEmpty
          ? const Center(
              child: Text('No existe ningun Galpon'),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: _galpones.length,
              itemBuilder: ((context, index) {
                final galpon = _galpones[index];
                return _GalponesItem(
                    galpon: galpon,
                    onTap: () => context.push('/galpon/${galpon.id}'));
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _addGalpon, label: const Text('añadir Galpon')),
    );
  }
}

class _GalponesItem extends StatelessWidget {
  final Galpon galpon;
  final VoidCallback onTap;
  const _GalponesItem({
    required this.galpon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final description = galpon.taskDescription();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Color(galpon.color),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home_filled,
                size: 50,
              ),
              Text(
                galpon.name,
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
              // if (description.isNotEmpty) ...[
              //   const SizedBox(height: 10),
              //   Text(
              //     description,
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 17,
              //     ),
              //   )
              // ]
            ],
          ),
        ),
      ),
    );
  }
}

// class _GalponesView extends StatelessWidget {
//   final <Galpon> []galpones;
//   _GalponesView({super.key, this.galpones});
  
//   final iconGalpon = Icon(
//     Icons.home_filled,
//     size: 60,
//   );
//   final colores = <Color>[
//     Colors.blue.shade100,
//     Colors.amber.shade100,
//     Colors.red.shade100,
//     Colors.green.shade100,
//     Colors.purple.shade100,
//     Colors.pink.shade100
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
//       itemCount: galpones.,
//       itemBuilder:
//     );
    
    
    
    // return GridView.count(
    //   crossAxisCount: 2,
    //   crossAxisSpacing: 20,
    //   mainAxisSpacing: 20,
    //   children: [
    //     Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20),
    //         color: colores[0],
    //       ),
    //       child: InkWell(
    //         onTap: () {
    //           String num = '1';
    //           context.push('/galpon/$num');
    //         },
    //         child: Column(children: [
    //           iconGalpon,
    //           Text(
    //             'Galpon 1',
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    //           ),
    //           Text(
    //             'Capacidad max.: 2000',
    //           ),
    //           Text('Capacidad libre: 0'),
    //           Text('N° de Lotes: 4'),
    //           Text('Cuarentena: No')
    //         ]),
    //         radius: 20,
    //       ),
    //     ),
    //     Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20),
    //         color: colores[1],
    //       ),
    //       child: InkWell(
    //         onTap: () {
    //           String num = '2';
    //           context.push('/galpon/$num');
    //         },
    //         child: Column(children: [
    //           iconGalpon,
    //           Text(
    //             'Galpon 2',
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    //           ),
    //           Text(
    //             'Capacidad max.: 2000',
    //           ),
    //           Text('Capacidad libre: 500'),
    //           Text('N° de Lotes: 2'),
    //           Text('Cuarentena: No')
    //         ]),
    //         radius: 20,
    //       ),
    //     ),
    //     Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20),
    //         color: colores[2],
    //       ),
    //       child: InkWell(
    //         onTap: () {
    //           String num = '3';
    //           context.push('/galpon/$num');
    //         },
    //         child: Column(children: [
    //           iconGalpon,
    //           Text(
    //             'Galpon 3',
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    //           ),
    //           Text(
    //             'Capacidad max.: 2000',
    //           ),
    //           Text('Capacidad libre: 700'),
    //           Text('N° de Lotes: 1'),
    //           Text('Cuarentena: No')
    //         ]),
    //         radius: 20,
    //       ),
    //     ),
    //   ],
    // );
//   }
// }
