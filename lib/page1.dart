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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor:const Color(0xFF070C16),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: false,
        title: const Text('RouteWise',
        style:TextStyle(fontSize:30,color:Colors.white),
        ),

      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the pare
        //hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhere


    );
  }


}