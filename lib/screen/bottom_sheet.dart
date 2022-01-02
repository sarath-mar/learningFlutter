import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Bottom sheet",
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            )),
            ElevatedButton(
                onPressed: () {
                  bottomSheetOpen(context);
                },
                child: Text("Bottom Sheet"))
          ],
        ),
      ),
    );
  }

  onSignOut(context) async {
    print("signout");
    Navigator.of(context).pop();
  }

  bottomSheetOpen(context) {
    print(context);
  showModalBottomSheet(
    context: context, 
  builder: (cntx){
   return Container(
     width: double.infinity,
     height: 500, 
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
       children: [
        
         Padding(
           padding: const EdgeInsets.all(20.0), 
           child: Text("Bottom Sheet Open"),
         ),
         IconButton(onPressed: (){
             Navigator.of(cntx).pop(); 
         }, icon: Icon(Icons.tv_off ))  
       ],
     )); 
  }
  );
  }
}
