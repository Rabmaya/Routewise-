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


  mainAxisAlignment: .start,
  children: [
    const SizedBox(height:30),
    Container(
      width:double.infinity,
      decoration:BoxDecoration(
        color: const Color(0xFFDDF3FC),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFBFE3f2),
        ),
      ),

      ),
    );
        }
}





