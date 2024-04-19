class Workshop {
  String title = "";
  String? description;
  DateTime? startTime;
  DateTime? endTime;
  int? ticketPrice;
  String? eventLocation;
  int? slots;
  int? registered;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'ticketPrice': ticketPrice,
      'eventLocation': eventLocation,
      'slots': slots,
      'registered': registered,
      'enrollments': [],
    };
  }
}
