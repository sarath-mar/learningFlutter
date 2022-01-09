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
                     leading: Text((index+1).toString()),
                    title:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, 
                      children: [
                        Text(newValue[index].name),
                         
                        Text(newValue[index].age), 
                      ],
                    ) ,
                    trailing:IconButton(onPressed: (){
                      print(index);
                        deleteStudent(newValue[index].id);    
                    }, icon: Icon(Icons.delete,color:Colors.red,)),  
                  );     
                },
                separatorBuilder: (context, index) {
                  return Divider( height: 1,);   
                },
                itemCount: newValue.length);   
          }), 
    );
  }
} 
