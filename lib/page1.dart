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
  String start = '';
  String destination = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF070C16),
        centerTitle: false,
        title: const Text(
          'RouteWise',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF8A8CF6),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: const Color(0xFFBFE3F2),
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Where to next?',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC400),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: startController,
                    decoration: InputDecoration(
                      hintText: 'Start Location',
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
              const SizedBox(height: 2),
                  Row(
                    children: [
                  const SizedBox(width: 10),
                  ElevatedButton(onPressed:(){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>  Page3(
                        start: startController.text,

                        destination:
                        destinationController.text,
                      ),
                      ),
                    );
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Search Bus',
                        style: TextStyle(fontSize: 15,
                          color: Colors.blueGrey,
                        ),
                      )
                  )
                ],
                  ),
                ],
              ),

              ),

            const SizedBox(height: 20),

            _favouritePath('gulshan to motizheel'),
          ],
        ),
      ),
    );
  }

  Widget _favouritePath(String path) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF8A8CF6),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xFFBFE3F2),
        ),
      ),

      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),

          const SizedBox(width: 6),

          Text(
            path,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF070C16),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

