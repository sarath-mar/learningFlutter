import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/list_view_generator.dart';
import 'package:login/student_function.dart';
import 'package:login/student_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Data base"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  hintText: "Enter your name", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
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
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                child: ElevatedButton(
                    onPressed: () {
                      deleteAllStudent();
                    },
                    child: Text("Delete All")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                child: ElevatedButton(
                    onPressed: () {
                      addToArray(context);
                    },
                    child: Text("Add")),
              ),
            ],
          ),
          Expanded(child: ListViewComponent())
        ],
      ),
    );
  }

  addToArray(cntx) {
    final age = _ageController.text;
    final name = _nameController.text;
    if (name == "") {
      ScaffoldMessenger.of(cntx).showSnackBar(SnackBar(
        content: Text("please enter your name"),
      ));
      return;
    }
    if (age == "") {
      ScaffoldMessenger.of(cntx).showSnackBar(SnackBar(
        content: Text("please enter your age"),
      ));
      return;
    }
    print(age);
    final value =
        StudentModel(age: _ageController.text, name: _nameController.text);
    addStudent(value);
    _ageController.text = "";
    _nameController.text = "";

    // array.add(_nameController.text);
    // print(array);
  }
}
