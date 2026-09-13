import 'package:flutter/material.dart';
import 'page3.dart';
import 'seat_page.dart';

class TicketPage extends StatelessWidget {
  final String busName;
  final String route;
  final String time;

  TicketPage({
    super.key,
    required this.busName,
    required this.route,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    List<String> times = time.split(',');

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor:  Colors.black,
        foregroundColor: Colors.white,
        title: Text("Ticket"),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Page3(start: '', destination: '',),
              ),
                  (route) => false,
            );
          },
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 20),

           Text(
            "Your Ticket",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

           SizedBox(height: 25),

          Text(
            "Bus: $busName",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),

           SizedBox(height: 15),

          Text(
            "Route: $route",
            style:  TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

           SizedBox(height: 25),

           Text(
            "Select Bus Time",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

           SizedBox(height: 15),

          for (String busTime in times)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatPage(
                      busName: busName,
                      route: route,
                      time: busTime.trim(),
                    ),
                  ),
                );
              },
              child: Text(busTime.trim()),
            ),
        ],
      ),
    );
  }
}


