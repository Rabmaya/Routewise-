import 'package:flutter/material.dart';

class BusDetails extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Bus Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // RouteWise Logo
            Image.asset(
              'assets/images/logo.jpeg',
              width: 140,
              height: 140,
              fit: BoxFit.contain,
            ),

            const SizedBox(width: 20),

            // Bus Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bus Name
                  Text(
                    busName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Start → Destination
                  Text(
                    "${route.split(" - ").first} → "
                    "${route.split(" - ").last}",
                    style: const TextStyle(color: Colors.black87, fontSize: 22),
                  ),

                  const SizedBox(height: 12),

                  // Time
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.blue,
                        size: 25,
                      ),

                      const SizedBox(width: 8),

                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
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
    );
  }
}
