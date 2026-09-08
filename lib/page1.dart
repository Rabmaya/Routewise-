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
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const Text(
            'Where to next?',
            style: TextStyle(fontSize:25,
                fontWeight: FontWeight.bold,
                color:Color(0xFFFFC400)
            ),
          ),
          const SizedBox(height:20),

          TextField(
            decoration: InputDecoration(
                hintText: 'Start Location',
                hintStyle: const TextStyle(color: Colors.blueGrey
                ),
                prefixIcon:const Icon(
                  Icons.search,
                  color:Colors.blueGrey,
                ),
                filled: true,
                fillColor:  const Color(0xFFAEB9CE),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color:Color(0xFF303747),
                  ),
                )
            ),
          ),

        ],
      ),
    ),

    const SizedBox(height:20),
        _favouritePath('gulshan to motizheel'),
      ],
    ),
      ),


    );
  }

}
Widget _favouritePath(String path){
  return Container(
    width: double.infinity,
    height:40,
    decoration: BoxDecoration(
        color: Color(0xFFFFC400),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: const Color(0xFFBFE3f2),

        )
    ),
    child:Row(
      children: [
        const Icon(
          Icons.search,
          color:Colors.yellow,
        ),
        const SizedBox(width: 6,),
        Text(path,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF070C16),
            fontWeight: .w500,
          ),
        )
      ],
    ),

  );
}





