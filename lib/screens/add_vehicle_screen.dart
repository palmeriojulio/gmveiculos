import 'package:flutter/material.dart';
import '../models/vehicle.dart';

class AddVehicleScreen extends StatefulWidget {
  final Function(Vehicle) onVehicleAdded;

  const AddVehicleScreen({super.key, required this.onVehicleAdded});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _kmController = TextEditingController();
  String _selectedType = 'car';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newVehicle = Vehicle(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        type: _selectedType,
        currentKm: int.parse(_kmController.text),
      );

      widget.onVehicleAdded(newVehicle);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Veículo'),
        backgroundColor: const Color.fromARGB(47, 102, 127, 100),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            // Adiciona margens ao widget
            top: 60, // Margem superior
            left: 40, // Margem esquerda
            right: 40 // Margem direita
            ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome do Veículo',
                  prefixIcon: const Icon(Icons.directions_car),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _kmController,
                decoration: InputDecoration(
                  labelText: 'Quilometragem',
                  prefixIcon: const Icon(Icons.speed),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo obrigatório';
                  if (int.tryParse(value) == null) return 'Valor inválido';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: InputDecoration(
                  labelText: 'Tipo de Veículo',
                  prefixIcon: const Icon(Icons.type_specimen),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'car',
                    child: Text('Carro'),
                  ),
                  DropdownMenuItem(
                    value: 'motorcycle',
                    child: Text('Moto'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: const Text(
                    'Salvar Veículo',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F667F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _kmController.dispose();
    super.dispose();
  }
}
