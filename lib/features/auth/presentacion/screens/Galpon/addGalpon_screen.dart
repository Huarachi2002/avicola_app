import 'package:avicola/features/models/galpon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/theme/theme.dart';

class AddGalponScreen extends StatefulWidget {
  const AddGalponScreen({super.key});

  @override
  State<AddGalponScreen> createState() => _AddGalponScreenState();
}

class _AddGalponScreenState extends State<AddGalponScreen> {
  Color selectedColor = Colors.primaries.first;
  final textNameGalpon = TextEditingController();
  final textCapGalpon = TextEditingController();
  String? errorMessage;

  void _onSave() {
    final name = textNameGalpon.text.trim();
    final capacidad = textCapGalpon.text.trim();
    if (capacidad.isEmpty) {
      setState(() {
        errorMessage = 'La capacidad es requerida';
      });
      return;
    }
    if (name.isEmpty) {
      setState(() {
        errorMessage = 'El nombre es requerido';
      });
      return;
    } else {
      setState(() {
        errorMessage = null;
      });
    }
    final result = Galpon(
        name: name,
        color: selectedColor.value,
        CapacidadMax: int.parse(capacidad));
    context.pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: selectedColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.home_filled,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: textNameGalpon,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            hintText: 'Nombre del Galpon',
                            border: InputBorder.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: textCapGalpon,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            hintText: 'Capacidad del Galpon',
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            errorMessage ?? '',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Text('Selecciona un Color'),
                      ),
                      Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: Colors.primaries.length,
                          itemBuilder: (context, index) {
                            final color = Colors.primaries[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedColor = color;
                                  });
                                },
                                child: CircleAvatar(backgroundColor: color),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: MaterialButton(
                          onPressed: _onSave,
                          color: colorSeed,
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Crear Galpon',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
