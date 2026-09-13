import 'package:flutter/material.dart';
import 'page3.dart';

void main() {
  runApp(const page1());
}

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {


  TextEditingController startController =
  TextEditingController();

  TextEditingController destinationController =
  TextEditingController();


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor:  Color(0xFF070C16),
        centerTitle: false,

        title:  Text(
          'RouteWise',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),


      body: Center(

        child: Column(

          mainAxisAlignment: .start,

          children: [

            SizedBox(height: 30),


            Container(

              width: double.infinity,

              decoration: BoxDecoration(
                color:  Color(0xFF8A8CF6),

                borderRadius: BorderRadius.circular(9),

                border: Border.all(
                  color:  Color(0xFFBFE3f2),
                ),
              ),


              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                   Text(
                    'Where to next?',

                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC400),
                    ),
                  ),


                   SizedBox(height: 20),



                  TextField(

                    controller: startController,

                    decoration: InputDecoration(

                      hintText: 'Start Location',

                      hintStyle:  TextStyle(
                        color: Colors.blueGrey,
                      ),

                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.blueGrey,
                      ),

                      filled: true,

                      fillColor: const Color(0xFFAEB9CE),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),

                        borderSide: const BorderSide(
                          color: Color(0xFF303747),
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 2),



                  TextField(

                    controller: destinationController,

                    decoration: InputDecoration(

                      hintText: 'Destination',

                      hintStyle: const TextStyle(
                        color: Colors.blueGrey,
                      ),

                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.blueGrey,
                      ),

                      filled: true,

                      fillColor: const Color(0xFFAEB9CE),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),

                        borderSide: const BorderSide(
                          color: Color(0xFF303747),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 10),



                  ElevatedButton(

                    onPressed: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) => Page3(

                            start: startController.text,

                            destination:
                            destinationController.text,
                          ),
                        ),
                      );
                    },

                    child:  Text(
                      "Search Bus",
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


