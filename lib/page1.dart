import 'package:flutter/material.dart';
import 'ticket_page.dart';
import 'page3.dart';
import 'seat_page.dart';
void main() {
  runApp(const page1());
}

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  int _selectedIndex = 0;

  late final List<Widget> _tabs = [
    const _HomeSearch(),

    TicketPage(
      busName: '',
      route: '',
      time: '',
    ),

    Page3(
      start: '',
      destination: '',
    ),

    SeatPage(
      busName: '',
      route: '',
      time: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF070C16),
        selectedItemColor: const Color(0xFFFFC400),
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_seat),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: 'Routes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_rounded),
            label: 'seats',
          ),
        ],
      ),
    );
  }
}

class _HomeSearch extends StatefulWidget {
  const _HomeSearch();

  @override
  State<_HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<_HomeSearch> {
  TextEditingController startController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
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
                color: Colors.blueGrey,
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
                      color: Colors.white,
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page3(
                                start: startController.text,
                                destination: destinationController.text,
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
                        child: const Text(
                          'Search Bus',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
        color: Colors.blueGrey,
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

