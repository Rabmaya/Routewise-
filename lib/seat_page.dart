import 'package:flutter/material.dart';
import 'confirm_ticket_page.dart';

class SeatPage extends StatelessWidget {
  final String busName;
  final String route;
  final String time;
  final List<String> selectedSeats;

  SeatPage({
    super.key,
    required this.busName,
    required this.route,
    required this.time,
    this.selectedSeats = const [],
  });

  final List<String> seats = [
    "1A",
    "1B",
    "1C",
    "1D",
    "2A",
    "2B",
    "2C",
    "2D",
    "3A",
    "3B",
    "3C",
    "3D",
    "4A",
    "4B",
    "4C",
    "4D",
    "5A",
    "5B",
    "5C",
    "5D",
    "6A",
    "6B",
    "6C",
    "6D",
    "7A",
    "7B",
    "7C",
    "7D",
    "8A",
    "8B",
    "8C",
    "8D",
    "9A",
    "9B",
    "9C",
    "9D",
    "10A",
    "10B",
    "10C",
    "10D",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(busName),
      ),

      body: ListView(
        children: [
          SizedBox(height: 20),

          Text(
            busName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5),

          Text(
            time,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),

          SizedBox(height: 20),

          Text(
            "Select Seats",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5),

          Text(
            "Selected: ${selectedSeats.length}/4",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),

          SizedBox(height: 20),

          for (int i = 0; i < seats.length; i += 4)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatButton(context, seats[i]),
                seatButton(context, seats[i + 1]),

                SizedBox(width: 30),

                seatButton(context, seats[i + 2]),
                seatButton(context, seats[i + 3]),
              ],
            ),

          SizedBox(height: 25),

          if (selectedSeats.isNotEmpty)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmTicketPage(
                      busName: busName,
                      route: route,
                      time: time,
                      seats: selectedSeats,
                    ),
                  ),
                );
              },
              child: Text("Continue"),
            ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget seatButton(BuildContext context, String seat) {
    bool selected = selectedSeats.contains(seat);

    return Container(
      margin: EdgeInsets.all(5),

      child: SizedBox(
        width: 45,
        height: 45,

        child: ElevatedButton(
          onPressed: () {
            if (selected) {
              return;
            }

            if (selectedSeats.length >= 4) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Maximum 4 tickets allowed")),
              );

              return;
            }

            List<String> newSeats = List.from(selectedSeats);

            newSeats.add(seat);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SeatPage(
                  busName: busName,
                  route: route,
                  time: time,
                  selectedSeats: newSeats,
                ),
              ),
            );
          },

          style: ElevatedButton.styleFrom(
            backgroundColor: selected ? Colors.lightBlueAccent : Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            padding: EdgeInsets.zero,
          ),

          child: Text(
            seat,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
