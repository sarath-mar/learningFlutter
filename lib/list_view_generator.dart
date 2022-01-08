import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/student_function.dart';
import 'package:login/student_model.dart';

class ListViewComponent extends StatelessWidget {
  
  ListViewComponent({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    getStudent(); 
    return Container(
      child: ValueListenableBuilder( 
          valueListenable: studentList,
          builder: (ctx,List<StudentModel> newValue, child) {
            return ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  return 
                  // Text(newValue[index].name);
                  ListTile(
                     
                    title:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, 
                      children: [
                        Text(newValue[index].name),
                         
                        Text(newValue[index].age), 
                      ],
                    ) ,
                  );     
                },
                separatorBuilder: (context, index) {
                  return Divider(); 
                },
                itemCount: newValue.length);   
          }), 
    );
  }
} 
