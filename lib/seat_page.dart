import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    "1A", "1B", "1C", "1D",
    "2A", "2B", "2C", "2D",
    "3A", "3B", "3C", "3D",
    "4A", "4B", "4C", "4D",
    "5A", "5B", "5C", "5D",
    "6A", "6B", "6C", "6D",
    "7A", "7B", "7C", "7D",
    "8A", "8B", "8C", "8D",
    "9A", "9B", "9C", "9D",
    "10A", "10B", "10C", "10D",
  ];

  @override
  Widget build(BuildContext context) {

    String docId = "${busName}_${route}_$time".replaceAll(' ', '_');

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text(busName),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('bus_seats')
            .doc(docId)
            .snapshots(),
        builder: (context, snapshot) {

          List<dynamic> bookedSeats = [];
          if (snapshot.hasData && snapshot.data!.exists) {
            bookedSeats = (snapshot.data!.data() as Map<String, dynamic>?)?['bookedSeats'] ?? [];
          }

          return ListView(
            children: [
              SizedBox(height: 20),
              Text(
                busName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                time,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Text(
                "Select Seats",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Selected: ${selectedSeats.length}/4",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(height: 20),


              for (int i = 0; i < seats.length; i += 4)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      width: 50,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: bookedSeats.contains(seats[i])
                            ? null
                            : () {
                          String seat = seats[i];
                          if (selectedSeats.contains(seat)) return;

                          if (selectedSeats.length >= 4) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Maximum 4 tickets allowed")),
                            );
                            return;
                          }

                          List<String> newSeats = List.from(selectedSeats)..add(seat);
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
                          backgroundColor: bookedSeats.contains(seats[i])
                              ? Colors.grey
                              : (selectedSeats.contains(seats[i])
                              ? Colors.lightBlueAccent
                              : Colors.white),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(seats[i],
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(width: 20),


                    SizedBox(
                      width: 50,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: bookedSeats.contains(seats[i + 1])
                            ? null
                            : () {
                          String seat = seats[i + 1];
                          if (selectedSeats.contains(seat)) return;

                          if (selectedSeats.length >= 4) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Maximum 4 tickets allowed")),
                            );
                            return;
                          }

                          List<String> newSeats = List.from(selectedSeats)..add(seat);
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
                          backgroundColor: bookedSeats.contains(seats[i + 1])
                              ? Colors.grey
                              : (selectedSeats.contains(seats[i + 1])
                              ? Colors.lightBlueAccent
                              : Colors.white),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(seats[i + 1],
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    SizedBox(width: 30),


                    SizedBox(
                      width: 50,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: bookedSeats.contains(seats[i + 2])
                            ? null
                            : () {
                          String seat = seats[i + 2];
                          if (selectedSeats.contains(seat)) return;

                          if (selectedSeats.length >= 4) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Maximum 4 tickets allowed")),
                            );
                            return;
                          }

                          List<String> newSeats = List.from(selectedSeats)..add(seat);
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
                          backgroundColor: bookedSeats.contains(seats[i + 2])
                              ? Colors.grey
                              : (selectedSeats.contains(seats[i + 2])
                              ? Colors.lightBlueAccent
                              : Colors.white),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(seats[i + 2],
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(width: 20),


                    SizedBox(
                      width: 50,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: bookedSeats.contains(seats[i + 3])
                            ? null
                            : () {
                          String seat = seats[i + 3];
                          if (selectedSeats.contains(seat)) return;

                          if (selectedSeats.length >= 4) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Maximum 4 tickets allowed")),
                            );
                            return;
                          }

                          List<String> newSeats = List.from(selectedSeats)..add(seat);
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
                          backgroundColor: bookedSeats.contains(seats[i + 3])
                              ? Colors.grey
                              : (selectedSeats.contains(seats[i + 3])
                              ? Colors.lightBlueAccent
                              : Colors.white),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(seats[i + 3],
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),

              SizedBox(height: 25),

              if (selectedSeats.isNotEmpty)
                ElevatedButton(
                  onPressed: () {

                    FirebaseFirestore.instance
                        .collection('bus_seats')
                        .doc(docId)
                        .set({
                      'bookedSeats': FieldValue.arrayUnion(selectedSeats),
                    }, SetOptions(merge: true));


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
          );

        },
      ),
    );
  }
}