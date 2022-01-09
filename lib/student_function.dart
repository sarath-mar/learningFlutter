import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:login/student_model.dart';

ValueNotifier<List<StudentModel>> studentList = ValueNotifier([]);
void addStudent(StudentModel data) async {
  final studentDB = await Hive.openBox<StudentModel>("Student_model");
 final  _id=await studentDB.add(data);
 data.id=_id;
 print(_id); 
 print("_id"); 
 print(data); 
  studentList.value.add(data);
  studentList.notifyListeners();
  print(studentList.value);
}

void getStudent() async { 
  final studentDB = await Hive.openBox<StudentModel>("Student_model");
  studentList.value.clear();
  studentList.value.addAll(studentDB.values);
  studentList.notifyListeners();
  // print(studentList.value);
}
void deleteStudent(id) async { 
  final studentDB = await Hive.openBox<StudentModel>("Student_model");
  print(id);       
  await studentDB.delete(id);      
  print("delete");  
  // print(studentList.value);
  print(studentDB.values);     
  getStudent();   
}
void deleteAllStudent() async { 
  final studentDB = await Hive.openBox<StudentModel>("Student_model");
  await studentDB.clear();      
  getStudent();   
}
