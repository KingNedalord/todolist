import 'package:hive/hive.dart';

part 'tasks.g.dart';

@HiveType(typeId: 0)
class Tasks{
  @HiveField(0)
  String title;
  @HiveField(1)
  String comment;

  Tasks({required this.title,required this.comment});
}