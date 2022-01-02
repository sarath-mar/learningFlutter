import 'package:flutter/material.dart';
import 'package:login/screen/home.dart';
import 'package:login/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY="user logged in";

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
    @override
  void initState() {
    goToLogin();  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Welcome to New Project...."))
        ],),
    );
  }
   goToLogin() async{ 
  print("created Print"); 
   await Future.delayed(Duration(seconds: 3));   
  //  Navigator.of(context).pushReplacement(
  //    MaterialPageRoute(builder: (ctx)=>LoginScreen()) 
  //  ); 
  login();
  }

  login()async{
    final _sharedPref=await SharedPreferences.getInstance();
    final getValue=_sharedPref.getBool(SAVE_KEY);
    print("getValue"); 
    print(getValue);
    if(getValue==null || !getValue){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cont)=>LoginScreen())) ;   
  }else{
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cont)=>HomeScreen())) ;   
  
  }
  
  }

}