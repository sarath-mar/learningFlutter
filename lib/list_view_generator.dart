import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/student_function.dart';
import 'package:login/student_model.dart';

class ListViewComponent extends StatelessWidget {
  
  ListViewComponent({Key? key}) : super(key: key);
//  final _nameController = TextEditingController();

//   final _ageController = TextEditingController();
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
                    trailing:Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [ 
                         IconButton(onPressed: (){
                          print("index");
                          editStudentPopUp(context,newValue[index],index+1);
                            // deleteStudent(newValue[index].id);     
                        }, icon: Icon(Icons.edit,color:Colors.green,)), 
                        IconButton(onPressed: (){
                          print(index);
                            deleteStudent(newValue[index].id);    
                        }, icon: Icon(Icons.delete,color:Colors.red,)),
                       
                      ],
                    ),   
                  );     
                },
                separatorBuilder: (context, index) {
                  return Divider( height: 1,);   
                },
                itemCount: newValue.length);   
          }), 
    );
  }
  editStudentPopUp(cntx,data,id){ 
  final _nameController = TextEditingController();

  final _ageController = TextEditingController(); 
  _nameController.text=data.name;   
  _ageController.text=data.age;  
  showDialog(context: (cntx), builder: (cntx1){
  return AlertDialog(
    content: Container(  
      height: 250,     
    child:  Column(
        children: [
          Text("Edit User Details"), 
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 18, 1, 10),   
            child: TextField(
              controller: _nameController, 
              decoration: InputDecoration(
                  hintText: "Enter your name", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 0, 1, 10), 
            child: TextField(
              controller: _ageController,
              decoration: InputDecoration(
                  hintText: "Enter your age", border: OutlineInputBorder()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0), 
                child: TextButton(
                    onPressed: () {
                      Navigator.of(cntx1).pop(); 
                    },
                    child: Text("Cancel")), 
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextButton(
                    onPressed: () {
                      final res=StudentModel(age: _ageController.text,name: _nameController.text);
                       updateStudent(data.id, res);  
                       Navigator.of(cntx1).pop();   
                    },
                    child: Text("Update")),  
              ),
            ],
          ),
        ]
  ),)); 
  });
  }
} 
