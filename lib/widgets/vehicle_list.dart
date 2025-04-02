import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import '../screens/vehicle_details_screen.dart';

class VehicleList extends StatelessWidget {
  final List<Vehicle> vehicles;

  const VehicleList({super.key, required this.vehicles});

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
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => VehicleDetailsScreen(vehicle: vehicles[index]),
          ),
        ),
      ),
    );
  }
}
