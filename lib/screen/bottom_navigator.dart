import 'package:flutter/material.dart';
import 'package:login/pages/account_page.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/search_page.dart';

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int index = 0;
  List pages = [Home(), Search(), Account()];

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
              icon: Icon(Icons.arrow_back_rounded))
        ],
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: ("Account")),
        ],
      ),
    );
  }

  onSignOut(context) async {
    print("signout");
    Navigator.of(context).pop();
  }
}
