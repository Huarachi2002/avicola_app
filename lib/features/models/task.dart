import 'package:objectbox/objectbox.dart';
import 'galpon.dart';

@Entity()
class Task {
  int id = 0;
  String description;
  bool completed = false;

  final galpon = ToOne<Galpon>();

  Task({required this.description});
}
