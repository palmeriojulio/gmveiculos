class Vehicle {
  final String id;
  final String name;
  final String type;
  int currentKm;
  List<Maintenance> maintenances;

  Vehicle({
    required this.id,
    required this.name,
    required this.type,
    required this.currentKm,
    this.maintenances = const [],
  });
}

class Maintenance {
  final String type;
  final String description;
  final DateTime date;
  final int km;

  Maintenance({
    required this.type,
    required this.description,
    required this.date,
    required this.km,
  });
}
