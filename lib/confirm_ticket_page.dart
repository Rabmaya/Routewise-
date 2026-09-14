import 'package:flutter/material.dart';
import 'ticket_page.dart';


class ConfirmTicketPage extends StatelessWidget {
  final String busName;
  final String route;
  final String time;
  final List<String> seats;

   ConfirmTicketPage({
    super.key,
    required this.busName,
    required this.route,
    required this.time,
    required this.seats,
  });

  @override
  Widget build(BuildContext context) {
    int total = seats.length * 20;

    return Scaffold(
      backgroundColor:  Colors.black26,

      appBar: AppBar(
        backgroundColor:  Colors.black,
        foregroundColor: Colors.white,
        title:  Text("Confirm Ticket"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

         SizedBox(height: 20),

          Text(
            "Ticket Details",
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
              fontSize: 19,
            ),
          ),

          SizedBox(height: 12),

          Text(
            "Time: $time",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),

           SizedBox(height: 12),

          Text(
            "Seats: ${seats.join(', ')}",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),

           SizedBox(height: 12),

          Text(
            "Number of Tickets: ${seats.length}",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),

           SizedBox(height: 12),

          Text(
            "Price per Ticket: ৳20",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),

          SizedBox(height: 20),

          Text(
            "Total: ৳$total",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title:  Text("Ticket Confirmed"),

                    content: Text(
                      "Your $busName ticket is confirmed.\n\n"
                          "Time: $time\n"
                          "Seats: ${seats.join(', ')}\n"
                          "Total: ৳$total",
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TicketPage(
                                busName: busName,
                                route: route,
                                time: time,
                              ),
                            ),
                                (route) => false,
                          );
                        },
                        child:  Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },

            child:  Text("Confirm Ticket"),
          ),
        ],
      ),
    );
  }
}