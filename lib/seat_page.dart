import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'confirm_ticket_page.dart';

class SeatPage extends StatefulWidget {
  final String busName;
  final String route;
  final String time;
  final String date;

  const SeatPage({
    super.key,
    required this.busName,
    required this.route,
    required this.time,
    required this.date,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final List<String> selectedSeats = [];

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
    String docId = "${widget.busName}_${widget.route}_${widget.date}_${widget.time}"
        .replaceAll(' ', '_')
        .replaceAll('/', '-');

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text(widget.busName),
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
            padding: EdgeInsets.symmetric(vertical: 10),
            children: [
               SizedBox(height: 10),
              Text(
                widget.busName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Date: ${widget.date} | Time: ${widget.time}",
                textAlign: TextAlign.center,
                style:  TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w500),
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
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        width: 50,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: bookedSeats.contains(seats[i])
                              ? null
                              : () {
                            setState(() {
                              if (selectedSeats.contains(seats[i])) {
                                selectedSeats.remove(seats[i]);
                              } else {
                                if (selectedSeats.length >= 4) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Maximum 4 tickets allowed")),
                                  );
                                  return;
                                }
                                selectedSeats.add(seats[i]);
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: bookedSeats.contains(seats[i])
                                ? Colors.grey
                                : (selectedSeats.contains(seats[i]) ? Colors.lightBlueAccent : Colors.white),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            seats[i],
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                       SizedBox(width: 10),


                      SizedBox(
                        width: 50,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: bookedSeats.contains(seats[i + 1])
                              ? null
                              : () {
                            setState(() {
                              if (selectedSeats.contains(seats[i + 1])) {
                                selectedSeats.remove(seats[i + 1]);
                              } else {
                                if (selectedSeats.length >= 4) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(content: Text("Maximum 4 tickets allowed")),
                                  );
                                  return;
                                }
                                selectedSeats.add(seats[i + 1]);
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: bookedSeats.contains(seats[i + 1])
                                ? Colors.grey
                                : (selectedSeats.contains(seats[i + 1]) ? Colors.lightBlueAccent : Colors.white),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            seats[i + 1],
                            style:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                       SizedBox(width: 40),


                      SizedBox(
                        width: 50,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: bookedSeats.contains(seats[i + 2])
                              ? null
                              : () {
                            setState(() {
                              if (selectedSeats.contains(seats[i + 2])) {
                                selectedSeats.remove(seats[i + 2]);
                              } else {
                                if (selectedSeats.length >= 4) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(content: Text("Maximum 4 tickets allowed")),
                                  );
                                  return;
                                }
                                selectedSeats.add(seats[i + 2]);
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: bookedSeats.contains(seats[i + 2])
                                ? Colors.grey
                                : (selectedSeats.contains(seats[i + 2]) ? Colors.lightBlueAccent : Colors.white),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            seats[i + 2],
                            style:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                       SizedBox(width: 10),


                      SizedBox(
                        width: 50,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: bookedSeats.contains(seats[i + 3])
                              ? null
                              : () {
                            setState(() {
                              if (selectedSeats.contains(seats[i + 3])) {
                                selectedSeats.remove(seats[i + 3]);
                              } else {
                                if (selectedSeats.length >= 4) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(content: Text("Maximum 4 tickets allowed")),
                                  );
                                  return;
                                }
                                selectedSeats.add(seats[i + 3]);
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: bookedSeats.contains(seats[i + 3])
                                ? Colors.grey
                                : (selectedSeats.contains(seats[i + 3]) ? Colors.lightBlueAccent : Colors.white),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            seats[i + 3],
                            style:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

               SizedBox(height: 25),

              if (selectedSeats.isNotEmpty)
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding:  EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('bus_seats')
                          .doc(docId)
                          .set({
                        'busName': widget.busName,
                        'route': widget.route,
                        'date': widget.date,
                        'time': widget.time,
                        'bookedSeats': FieldValue.arrayUnion(selectedSeats),
                      }, SetOptions(merge: true));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmTicketPage(
                            busName: widget.busName,
                            route: widget.route,
                            time: widget.time,
                            seats: selectedSeats,
                          ),
                        ),
                      );
                    },
                    child:  Text(
                      "Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),

               SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}