import 'dart:async';
import 'package:flutter/material.dart';

class BusDetails extends StatefulWidget {
  final String busName;
  final String route;
  final String time;

  const BusDetails({
    super.key,
    required this.busName,
    required this.route,
    required this.time,
  });

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  int currentLocation = 0;

  Timer? timer;

  late List<String> locations;

  @override
  void initState() {
    super.initState();

    locations = widget.route.split(" - ").map((e) => e.trim()).toList();

    // প্রতি 5 মিনিটে location change হবে
    timer = Timer.periodic(const Duration(minutes: 5), (Timer t) {
      if (!mounted) return;

      if (currentLocation < locations.length - 1) {
        setState(() {
          currentLocation++;
        });
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // =====================================
  // Location অনুযায়ী time
  // =====================================

  String getLocationTime(int index) {
    String input = widget.time.trim();

    bool isPM = input.toUpperCase().contains("PM");

    input = input
        .replaceAll("AM", "")
        .replaceAll("PM", "")
        .replaceAll("am", "")
        .replaceAll("pm", "")
        .trim();

    List<String> parts = input.split(":");

    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    if (isPM && hour != 12) {
      hour += 12;
    }

    if (!isPM && hour == 12) {
      hour = 0;
    }

    // প্রতি location-এ 5 মিনিট
    minute = minute + (index * 5);

    DateTime date = DateTime(2026, 1, 1, hour, minute);

    int displayHour = date.hour;

    String period = "AM";

    if (displayHour >= 12) {
      period = "PM";
    }

    if (displayHour > 12) {
      displayHour -= 12;
    }

    if (displayHour == 0) {
      displayHour = 12;
    }

    return "$displayHour:"
        "${date.minute.toString().padLeft(2, '0')} $period";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f8ff),

      // =====================================
      // APP BAR
      // =====================================
      appBar: AppBar(
        backgroundColor: const Color(0xff102443),
        foregroundColor: Colors.white,

        title: const Text(
          "Bus Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      // =====================================
      // BODY
      // =====================================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // =================================
            // BUS INFORMATION
            // =================================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(15),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Row(
                children: [
                  // Bus Icon
                  Container(
                    width: 110,
                    height: 110,

                    decoration: BoxDecoration(
                      color: const Color(0xffe5f2ff),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: const Icon(
                      Icons.directions_bus,
                      color: Colors.blue,
                      size: 75,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Bus information
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          widget.busName,

                          style: const TextStyle(
                            color: Color(0xff102443),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(
                              Icons.route,
                              color: Colors.blue,
                              size: 20,
                            ),

                            const SizedBox(width: 7),

                            Expanded(
                              child: Text(
                                "${locations.first} → "
                                "${locations.last}",

                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.blue,
                              size: 20,
                            ),

                            const SizedBox(width: 7),

                            Text(
                              widget.time,

                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =================================
            // ROUTE INFORMATION
            // =================================
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue, size: 28),

                      SizedBox(width: 8),

                      Text(
                        "Route Information",

                        style: TextStyle(
                          color: Color(0xff102443),
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // সব location
                  for (int i = 0; i < locations.length; i++)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            // Timeline
                            SizedBox(
                              width: 30,

                              child: Column(
                                children: [
                                  Icon(
                                    i == currentLocation
                                        ? Icons.location_on
                                        : (i == 0 || i == locations.length - 1)
                                        ? Icons.location_on
                                        : Icons.circle,

                                    color: i == currentLocation
                                        ? Colors.blue
                                        : Colors.grey,

                                    size: i == currentLocation ? 25 : 15,
                                  ),

                                  if (i != locations.length - 1)
                                    Container(
                                      width: 2,
                                      height: 40,
                                      color: Colors.blue,
                                    ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 12),

                            // Location + Time
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),

                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        locations[i],

                                        style: TextStyle(
                                          fontSize: 17,

                                          fontWeight: i == currentLocation
                                              ? FontWeight.bold
                                              : FontWeight.normal,

                                          color: i == currentLocation
                                              ? const Color(0xff102443)
                                              : Colors.black54,
                                        ),
                                      ),
                                    ),

                                    Text(
                                      getLocationTime(i),

                                      style: TextStyle(
                                        fontSize: 14,

                                        fontWeight: i == currentLocation
                                            ? FontWeight.bold
                                            : FontWeight.normal,

                                        color: i == currentLocation
                                            ? Colors.blue
                                            : Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // =================================
            // AVAILABLE SEATS
            // =================================
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Row(
                children: [
                  const Icon(Icons.event_seat, color: Colors.blue, size: 32),

                  const SizedBox(width: 12),

                  const Text(
                    "Available Seats",

                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),

                  const Spacer(),

                  const Text(
                    "40",

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
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
}
