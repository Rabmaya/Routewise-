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
    // Route-এর সব location আলাদা করা
    List<String> locations = route.split(" - ").map((e) => e.trim()).toList();

    return Scaffold(
      backgroundColor: Colors.white,

      // ================= APP BAR =================
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

      // ================= BODY =================
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= BUS DETAILS =================

              Row(
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

                  // Bus Information
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
                          "${locations.first} → "
                          "${locations.last}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                          ),
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

              const SizedBox(height: 25),

              // ================= ROUTE INFORMATION BOX =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  // BLACK BOX
                  color: Colors.black,

                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Route Information Title
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.white, size: 25),

                        SizedBox(width: 8),

                        Text(
                          "Route Information",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // ================= LOCATION LIST =================
                    for (int i = 0; i < locations.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),

                        child: Row(
                          children: [
                            // Location Icon
                            SizedBox(
                              width: 30,

                              child: Icon(
                                i == 0 ? Icons.location_on : Icons.circle,

                                // WHITE ICON
                                color: Colors.white,

                                size: i == 0 ? 22 : 14,
                              ),
                            ),

                            // Location Name
                            Expanded(
                              child: Text(
                                locations[i],
                                style: const TextStyle(
                                  // WHITE TEXT
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),

                            // Time
                            if (i == 0)
                              Text(
                                time,
                                style: const TextStyle(
                                  // WHITE TIME
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
