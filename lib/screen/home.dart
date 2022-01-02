import 'package:flutter/material.dart';
import 'package:login/screen/login.dart';
import 'package:login/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final _count = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project x"),
        actions: [
          IconButton(
              onPressed: () {
                print("back button");
                onSignOut(context);
              },
              icon: Icon(Icons.exit_to_app_outlined))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Counter : ${_count.toString()}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    FloatingActionButton(
                        onPressed: () {}, child: Icon(Icons.add))
                  ]),
            )
            //   Text("Home",
            //   style: TextStyle(fontSize: 40 ),),

            //   Container(
            //     color:Colors.red ,
            //     child: Row(

            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [

            //         Text("Counter : "),
            //         Text(_count.toString())
            //       ],
            //     ),
            //   )
          ],
        ),
      ),
    );
  }

  onSignOut(BuildContext context) async {
    print("signout");
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.clear();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cnt) {
      return SplashScreen();
    }));
  }
}
