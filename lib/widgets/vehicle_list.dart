import 'package:flutter/material.dart';
import '../models/vehicle.dart';

class VehicleList extends StatelessWidget {
  final List<Vehicle> vehicles;
  final Function(Vehicle) onTapVehicle;

  const VehicleList({
    super.key,
    required this.vehicles,
    required this.onTapVehicle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: Icon(vehicles[index].type == 'car'
            ? Icons.directions_car
            : Icons.motorcycle),
        title: Text(vehicles[index].name),
        subtitle: Text('${vehicles[index].currentKm} km'),
        onTap: () => onTapVehicle(vehicles[index]),
      ),
    );
  }
}