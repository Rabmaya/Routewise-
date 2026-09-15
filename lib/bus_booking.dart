class BusBooking {
  static final Map<String, Set<String>> bookedSeats = {};

  static String key(String busName, String time) {
    return "$busName-$time";
  }

  static void addBooking(String busName, String time, List<String> seats) {
    String k = key(busName, time);

    bookedSeats.putIfAbsent(k, () => {});

    bookedSeats[k]!.addAll(seats);
  }

  static int availableSeats(String busName, String time) {
    const int totalSeats = 40;

    String k = key(busName, time);

    int booked = bookedSeats[k]?.length ?? 0;

    return totalSeats - booked;
  }
}
