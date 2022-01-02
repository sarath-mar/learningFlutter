import 'package:flutter/material.dart';
import 'package:login/screen/login.dart';
import 'package:login/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class  HomeScreen extends StatelessWidget {
  const HomeScreen ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project x"),
      actions: [IconButton(onPressed: (){
        print("back button"); 
        onSignOut(context);  
         }, icon: Icon(Icons.exit_to_app_outlined))],  
      
      ), 
      body: Container( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Center(child: Text("Home")),
        ],
      ),
      
    ),
    );
    
    
     
  }
  onSignOut(BuildContext context) async{  
    print("signout");
    final sharedPref=await SharedPreferences.getInstance();
   await sharedPref.clear();
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cnt){
     return SplashScreen(); 
   }));
  }
}