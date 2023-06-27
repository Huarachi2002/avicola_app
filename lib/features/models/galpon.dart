import 'package:objectbox/objectbox.dart';
import 'lote.dart';

@Entity()
class Galpon {
  @Id()
  int id = 0;
  String name;
  int color;
  // ignore: non_constant_identifier_names
  int CapacidadMax;
  // ignore: non_constant_identifier_names
  int CapacidadLibre;
  // ignore: non_constant_identifier_names
  bool Cuarentena = false;

  @Backlink()
  final lotes = ToMany<Lote>();

  Galpon({
    required this.name,
    required this.color,
    // ignore: non_constant_identifier_names
    required this.CapacidadMax,
  }) : CapacidadLibre = CapacidadMax;
}
