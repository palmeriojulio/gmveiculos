import 'package:flutter/material.dart';
import 'add_maintenance_screen.dart';
import '../models/vehicle.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailsScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(vehicle.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tipo: ${vehicle.type == 'car' ? 'Carro' : 'Moto'}'),
            Text('Quilometragem: ${vehicle.currentKm} km'),
            const SizedBox(height: 20),
            const Text('Manutenções:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: vehicle.maintenances.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(vehicle.maintenances[index].type),
                  subtitle: Text(vehicle.maintenances[index].description),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => AddMaintenanceScreen(vehicle: vehicle),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
