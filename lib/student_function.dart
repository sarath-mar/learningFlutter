import 'package:flutter/cupertino.dart';
import 'package:login/student_model.dart';

ValueNotifier <List <StudentModel> >studentList=ValueNotifier([]);
void addStudent (StudentModel data){
   studentList.value.add(data);
   studentList.notifyListeners();  
   print(studentList.value);     
}
