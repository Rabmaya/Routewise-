import 'package:flutter/material.dart';
import 'ticket_page.dart';
import 'page1.dart';

class Page3 extends StatelessWidget {
  final String start;
  final String destination;

  Page3({
    super.key,
    required this.start,
    required this.destination,
  });

  final List<Map<String, String>> buses = [
    {
      "name": "Padma",
      "route":
      "Mirpur-12 - Mirpur-11 - Mirpur-10 - Kazipara - Shewrapara - Agargaon - Rang Bhaban - AUST",
      "time": "6:30 AM, 8:15 AM"
    },
    {
      "name": "Meghna",
      "route":
      "Proshika Bhaban - Sheyabari More - Rynkhola - Tolarbagh - Kallyanpur - Shyamoli - Asadgate - Manik Mia Avenue - Rang Bhaban - AUST",
      "time": "6:30 AM, 8:15 AM"
    },
    {
      "name": "Jamuna",
      "route":
      "Mohammadpur - Sankar - Dhanmondi(15) - Jigatola - Nilkhet - City College - Rasel Square - Panthapath - Sonargaon Hotel - AUST",
      "time": "6:45 AM, 8:30 AM"
    },
    {
      "name": "Surma",
      "route":
      "Sutrapur - Dayaganj - Joykali Mondir - Ittefaq Office - Kamalapur - Shahjahanpur - Mouchak - Moghbazar More - AUST",
      "time": "6:30 AM, 8:15 AM"
    },
    {
      "name": "Kornofuli",
      "route":
      "Chashara - Signboard - Jatrabari Flyover - Khilgaon - Malibagh - Moghbazar - AUST",
      "time": "6:15 AM, 8:10 AM"
    },
    {
      "name": "Brahmaputra",
      "route":
      "Demra Staff Quarter - Meradia - Banasree - Rampura Bridge - Badda - Gulshan Link Road - AUST",
      "time": "6:30 AM, 8:00 AM"
    },
    {
      "name": "Kopotakkha-1",
      "route":
      "Tongi College Gate - Abdullahpur - ECB Chattar - Banani - Mohakhali - Nabisco - AUST",
      "time": "6:30 AM"
    },
    {
      "name": "Kopotakkha-2",
      "route":
      "Tongi College Gate - Abdullahpur - Airport - Kawla - AUST",
      "time": "9:00 AM"
    },
    {
      "name": "Korotoa",
      "route":
      "Khilkhet - Bishwaroad - MES - ECB - Kalshi - MES - Banani - Mohakhali - AUST",
      "time": "8:50 AM"
    },
    {
      "name": "Modhumoti",
      "route":
      "Shyamoli - Kallyanpur - Mirpur-1 - Mirpur-10 - Kazipara - Bijoy Sarani - AUST",
      "time": "10:30 AM"
    },
    {
      "name": "Rupsha",
      "route":
      "Sign Board - Sonirakhra Flyover - Golapbagh - Basabo - Khilgaon - Mouchak - Moghbazar - AUST",
      "time": "10:30 AM"
    },
    {
      "name": "Tista",
      "route":
      "AUST - Mohakhali - Banani - ECB - Khilkhet - Airport",
      "time": "6:15 PM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    String startPoint = start.trim().toLowerCase();
    String destinationPoint = destination.trim().toLowerCase();

    List<Map<String, String>> result = [];


    if (startPoint.isNotEmpty && destinationPoint.isNotEmpty) {
      for (var bus in buses) {
        String route = bus["route"]!.toLowerCase();

        if (route.contains(startPoint) &&
            route.contains(destinationPoint)) {
          result.add(bus);
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.black, //Color(0xff050b18),

      appBar: AppBar(
        backgroundColor: Colors.black, //Color(0xff050b18),
        foregroundColor: Colors.white,
        title:  Text("Available Buses"),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => page1(),
              ),
                  (route) => false,
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => page1(),
            ),
                (route) => false,
          );
        },
        child:  Icon(Icons.home),
      ),

      body: ListView(
        children: [
          SizedBox(height: 20),

          Text(
            "$start → $destination",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

           SizedBox(height: 20),


          if (startPoint.isEmpty || destinationPoint.isEmpty)
             Center(
              child: Text(
                "Please enter start and destination",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),

          if (startPoint.isNotEmpty &&
              destinationPoint.isNotEmpty &&
              result.isEmpty)
             Center(
              child: Text(
                "No buses found",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),


          for (var bus in result)
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketPage(
                      busName: bus["name"]!,
                      route: bus["route"]!,
                      time: bus["time"]!,
                    ),
                  ),
                );
              },

              child: Container(
                margin:  EdgeInsets.only(bottom: 15),
                padding:  EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      bus["name"]!,
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                     SizedBox(height: 8),


                    Text(
                      bus["route"]!,
                      style:  TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                     SizedBox(height: 8),


                    Text(
                      "Time: ${bus["time"]!}",
                      style:  TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}