import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  String name;
  
  @HiveField(1)
  String age;

  StudentModel({required this.name, required this.age});
}
