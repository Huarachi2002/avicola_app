import 'package:objectbox/objectbox.dart';
import 'task.dart';

@Entity()
class Galpon {
  int id = 0;
  String name;
  int color;
  int CapacidadMax;
  int CapacidadLibre;
  bool Cuarentena = false;

  @Backlink()
  final tasks = ToMany<Task>();

  Galpon({
    required this.name,
    required this.color,
    required this.CapacidadMax,
  }) : CapacidadLibre = CapacidadMax;

  String taskDescription() {
    final tasksCompleted = tasks.where((task) => task.completed).length;
    if (tasks.isEmpty) {
      return '';
    }
    return '$tasksCompleted of ${tasks.length}';
  }
}
