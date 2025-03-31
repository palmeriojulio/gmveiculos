import 'package:flutter/material.dart';
import '../models/vehicle.dart';

class VehicleDetailsScreen extends StatefulWidget {
  final Vehicle vehicle;

  const VehicleDetailsScreen({super.key, required this.vehicle});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vehicle.name),
        backgroundColor: const Color(0xFF1B5E20),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tipo: ${widget.vehicle.type == 'car' ? 'Carro' : 'Moto'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Quilometragem: ${widget.vehicle.currentKm} km',
              style: const TextStyle(fontSize: 16),
            ),
            const Divider(height: 30),
            const Text(
              'Histórico de Manutenções',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.vehicle.maintenances.length,
                itemBuilder: (context, index) {
                  final maintenance = widget.vehicle.maintenances[index];
                  return Card(
                    child: ListTile(
                      title: Text(maintenance.type),
                      subtitle: Text(maintenance.description),
                      trailing: Text(
                        '${maintenance.date.day}/${maintenance.date.month}/${maintenance.date.year}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Container(),
            ),
          );
          setState(() {}); // Atualiza a lista após adicionar manutenção
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
