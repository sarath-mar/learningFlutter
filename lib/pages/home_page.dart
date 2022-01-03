import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({ Key? key }) : super(key: key);
  final array=["Sarath","Rahul","Dileep","Samji"]; 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Home",style: TextStyle(fontSize: 30),),
          DropdownButtonFormField(
            onChanged: (valu){
                 print(valu);  
            }, 
            items:array.map((x){
           return DropdownMenuItem(
             value: x,
             child: Text(x));
          }).toList() 
          )
        ],
      ),
      
    );
  }
}