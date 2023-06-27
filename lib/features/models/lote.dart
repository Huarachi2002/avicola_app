import 'package:objectbox/objectbox.dart';
import 'galpon.dart';

@Entity()
class Lote {
  @Id()
  int id = 0;

  String name;
  int color;
  // ignore: non_constant_identifier_names
  int Capacidad;

  final galpon = ToOne<Galpon>();

  Lote({
    required this.name,
    required this.color,
    // ignore: non_constant_identifier_names
    required this.Capacidad,
  });
}
  // String taskDescription() {
  //   final tasksCompleted = tasks.where((task) => task.completed).length;
  //   if (tasks.isEmpty) {
  //     return '';
  //   }
  //   return '$tasksCompleted of ${tasks.length}';
  // }