import 'package:flutter/material.dart';
import 'package:avicola/features/models/lote.dart';
import 'package:avicola/features/models/models.dart';
import 'package:avicola/objectbox.g.dart';
import 'package:go_router/go_router.dart';

import 'Lote/addLote_screen.dart';

class GalponScreen extends StatefulWidget {
  final String id;
  const GalponScreen({super.key, required this.id});
  static final name = 'galpon $Widget.num - screen ';

  @override
  State<GalponScreen> createState() => _GalponScreenState();
}

class _GalponScreenState extends State<GalponScreen> {
  final _lotes = <Lote>[];
  late final Store _store;
  late final Box<Lote> _lotesBox;

  Future<void> _addGalpon() async {
    final result = await showDialog(
        context: context, builder: (_) => const AddLoteScreen());
    if (result != null && result is Lote) {
      //insert into the database
      _lotesBox.put(result);
      _loadLotes();
    }
  }

  void _loadLotes() {
    _lotes.clear();
    setState(() {
      _lotes.addAll(_lotesBox.getAll());
    });
  }

  Future<void> _loadStore() async {
    _store = await openStore();
    _lotesBox = _store.box<Lote>();
    _loadLotes();
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
        title: const Text('Lotes'),
      ),
      body: _lotes.isEmpty
          ? const Center(
              child: Text('No existe ningun lote'),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: _lotes.length,
              itemBuilder: ((context, index) {
                final lote = _lotes[index];
                return _LotesItem(
                    lote: lote, onTap: () => context.push('/lote/${lote.id}'));
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _addGalpon, label: const Text('añadir Lote')),
    );
  }
}

class _LotesItem extends StatelessWidget {
  final Lote lote;
  final VoidCallback onTap;
  const _LotesItem({
    required this.lote,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final description = lote.taskDescription();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Color(lote.color),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_home_rounded,
                size: 50,
              ),
              Text(
                lote.name,
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
