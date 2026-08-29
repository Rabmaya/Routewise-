import 'package:flutter/material.dart';

void main() {
  runApp(const page1());
}

class page1 extends StatelessWidget {
  const page1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor:const Color(0xFF070C16),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: false,
        title: const Text('RouteWise',
        style:TextStyle(fontSize:30,color:Colors.white),
        ),

      ),
      body: Center(

child: Column(



    const SizedBox(height:20),
    _favouritePath('gulshan to motizheel'),
        ],
  //hvfjhgjfgjjggjhgj
      ),
      ),

    );
  }

