import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/vehicle.dart';

class AddMaintenanceScreen extends StatefulWidget {
  final Vehicle vehicle;

  const AddMaintenanceScreen({super.key, required this.vehicle});

  @override
  State<AddMaintenanceScreen> createState() => _AddMaintenanceScreenState();
}

class _AddMaintenanceScreenState extends State<AddMaintenanceScreen> {
  final _typeController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Manutenção')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _typeController,
              decoration:
                  const InputDecoration(labelText: 'Tipo de Manutenção'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            ListTile(
              title: Text(DateFormat('dd/MM/yyyy').format(_selectedDate)),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            ElevatedButton(
              onPressed: () {
                widget.vehicle.maintenances.add(
                  Maintenance(
                    type: _typeController.text,
                    description: _descriptionController.text,
                    date: _selectedDate,
                    km: widget.vehicle.currentKm,
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Salvar Manutenção'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _typeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
