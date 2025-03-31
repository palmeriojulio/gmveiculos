class Vehicle {
  final String id;
  final String name;
  final String type;
  final int currentKm;
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
  final DateTime date;
  final String description;

  Maintenance({
    required this.type,
    required this.date,
    required this.description,
  });
}