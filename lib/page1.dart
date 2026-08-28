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
child: Column(
// Column is also a layout widget. It takes a list of children and
// arranges them vertically. By default, it sizes itself to fit its
// children horizontally, and tries to be as tall as its parent.
//
// Column has various properties to control how it sizes itself and
// how it positions its children. Here we use mainAxisAlignment to
// center the children vertically; the main axis here is the vertical
// axis because Columns are vertical (the cross axis would be
// horizontal).
//
// TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// action in the IDE, or press "p" in the console), to see the
// wireframe for each widget.


    ),
    const SizedBox(height:20),
    _favouritePath('gulshan to motizheel'),
  ],
   ),
      ),
    );
  }


}