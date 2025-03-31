import 'package:flutter/material.dart';
import '../models/vehicle.dart';

class AddVehicleScreen extends StatefulWidget {
  final Function(Vehicle) onVehicleAdded;

  const AddVehicleScreen(void Function(Vehicle newVehicle) addVehicle,
      {super.key, required this.onVehicleAdded});

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
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        backgroundColor: const Color.fromARGB(47, 102, 127, 100),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            // Adiciona margens ao widget
            top: 60, // Margem superior
            left: 20, // Margem esquerda
            right: 20 // Margem direita
            ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Veículo',
                  prefixIcon: Icon(Icons.directions_car),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira um nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _kmController,
                decoration: const InputDecoration(
                  labelText: 'Quilometragem Atual',
                  prefixIcon: Icon(Icons.speed),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira a quilometragem';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Valor inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: const InputDecoration(
                    labelText: 'Tipo de Veículo',
                    prefixIcon: Icon(Icons.directions_car)),
                items: const [
                  DropdownMenuItem(
                    value: 'car',
                    child: Text('Carro'),
                  ),
                  DropdownMenuItem(
                    value: 'motorcycle',
                    child: Text('Moto'),
                  ),
                  DropdownMenuItem(
                    value: 'quadricycle',
                    child: Text('Quadriciclo'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F667F),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 145, vertical: 5),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_box, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Adicionar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
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
