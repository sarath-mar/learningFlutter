import 'package:flutter/material.dart';
import 'package:login/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _visible = false;
  final _formKey=GlobalKey<FormState>();   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _userTextController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "UserName"),
                       validator:(value){
                        if(value==null || value.isEmpty){ 
                            return "Empty feild";  
                        } 
                      } , 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordTextController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Password"),
                      validator:(_){
                        if(_visible){
                            return "Error"; 
                        }else{
                          
                        } 
                      } , 
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _visible,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Please fill user and password feild",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          print("Clicked");
                          onLogin(context);
                          _formKey.currentState!.validate();  
                        },
                        child: Text("Login")),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  onLogin(BuildContext cntx) async{

    final errorOne = "Please fill user and password feild";
    final errorTwo = "User and password is incorrect ";
    final userName = _userTextController.text;
    final password = _passwordTextController.text;
    if (userName == '' && password == '') {
      print("null value");
      setState(() {
         _visible = true; 
      });
       
      // snackbar
      ScaffoldMessenger.of(cntx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(errorOne),
        margin: EdgeInsets.all(10),
      ));
    } else if (userName == password) {
      print(userName);
      final sharedPref=await SharedPreferences.getInstance();
      sharedPref.setBool(SAVE_KEY, true);
      Navigator.of(cntx).pushReplacement( 
        MaterialPageRoute(builder: (context){ 
          return HomeScreen();
        })
      );
      print("router calles");
      setState(() {
        _visible = false;
      }); 
      
      print("same value");
    } else {
      final sharedPref=await SharedPreferences.getInstance();
      sharedPref.setBool(SAVE_KEY, false);
      print(userName);
      setState(() {
        _visible = false;
      });
      
      showDialog(
          context: cntx,
          builder: (cntx1) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(errorTwo),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(cntx1).pop();
                    },
                    child: Text("Ok"))
              ],
            );
          });
    }
  }
}
